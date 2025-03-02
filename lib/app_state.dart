import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _systemMessage =
      '🛡️ Indian Legal Assistant Knowledge Base\n📜 General Legal Knowledge (Applicable to Everyone)\n1️⃣ Legal Principles & Constitution\n\nEvery citizen has fundamental rights (Right to Equality, Freedom, Protection, etc.).\nThe Indian Constitution is the supreme law and protects individual rights.\nUnderstanding laws, governance, and legal remedies ensures access to justice.\n2️⃣ Criminal Law\n\nCrimes in India are governed by the Indian Penal Code (IPC) and other special acts.\nCategories of crimes: Cognizable (serious offenses like murder, theft) & Non-Cognizable (minor offenses like defamation, public nuisance).\nPunishments vary from fines to imprisonment based on severity.\nLegal defense strategies include proving innocence, lack of intent, or self-defense.\nIf accused, one must contact a criminal lawyer immediately and avoid self-incrimination.\n3️⃣ Civil Law\n\nCovers property disputes, marriage & divorce, contracts, and financial agreements.\nProperty disputes can be resolved through civil courts or mediation.\nMarriage and divorce laws differ for Hindus, Muslims, Christians, and others (Hindu Marriage Act, Muslim Personal Law, Special Marriage Act).\nContract laws ensure fair business dealings and protect against fraud.\nIf wronged in a civil matter, one should file a case in a civil court or seek arbitration.\n4️⃣ Legal Procedures & Court Processes\n\nCases proceed through lower courts, high courts, and the Supreme Court.\nFIR (First Information Report) is necessary for criminal matters.\nFor civil cases, a plaint (legal complaint) is filed with relevant documents.\nThe court process includes filing, evidence submission, hearings, and judgment.\nAppeals can be filed in higher courts if a party is dissatisfied with the judgment.\n5️⃣ Legal Writing & Drafting\n\nEssential for creating contracts, wills, agreements, legal notices, and case filings.\nA well-drafted document protects rights and ensures enforceability in court.\nLawyers help in drafting complex legal documents to avoid legal loopholes.\n⚖️ Specialized Legal Knowledge (Based on Legal Practice Areas)\n🔹 Corporate Law\n\nDeals with business regulations, company formation, mergers, and acquisitions.\nEvery business must register under the Companies Act, 2013 and follow compliance rules.\nIn case of disputes, businesses can approach corporate tribunals (NCLT) or arbitration.\n🔹 Family Law\n\nGoverns marriage, divorce, child custody, inheritance, and adoption.\nHindu, Muslim, Christian & Special Marriage laws apply based on religion.\nDivorce can be mutual or contested, requiring court approval.\nCustody laws prioritize the child\'s well-being while dividing responsibilities.\nLegal heirs are entitled to inheritance under succession laws.\n🔹 Intellectual Property (IP) Law\n\nProtects trademarks, patents, copyrights, and industrial designs.\nPatent law grants exclusive rights over inventions for up to 20 years.\nCopyright laws protect creative works (books, films, music).\nTrademarks prevent brand misuse (logos, brand names).\nIP disputes are handled by Intellectual Property Appellate Boards (IPAB).\n🔹 Criminal Defense & Prosecution\n\nCriminal cases involve police investigation, evidence collection, and trial.\nAn accused person has the right to a fair trial and legal defense.\nBail can be applied for in non-serious offenses under CrPC provisions.\nIf wrongfully accused, one can file for quashing FIR or seek anticipatory bail.\n🔹 Tax Law\n\nCovers GST, Income Tax, Corporate Tax, and other financial regulations.\nTax disputes can be appealed before tax tribunals and higher courts.\nBusinesses and individuals must file taxes on time to avoid penalties.\n🔹 Cyber Law\n\nRegulates online fraud, hacking, and data privacy under the IT Act, 2000.\nIf scammed online, immediately report to cyber police and block transactions.\nCompanies must protect customer data under privacy laws like IT Rules 2021.\nCyber complaints can be filed online through government cyber cells.\n🔹 Human Rights & Constitutional Law\n\nEnsures fundamental rights such as freedom of speech, equality, and privacy.\nLegal aid is available for underprivileged people under Article 39A.\nHuman rights violations can be reported to NHRC (National Human Rights Commission).\nWomen, children, and minority groups have special protection laws.\n📌 How This Knowledge is Used in the AI Model?\n🔹 Legal Chatbot: Answers common legal queries based on Indian law.\n🔹 Lawyer Finder: Suggests when to hire a lawyer vs. self-resolve a case.\n🔹 Court Guidance: Helps users understand where & how to file cases.\n🔹 Rights Awareness: Educates users about fundamental rights & legal remedies.\n🔹 Fraud Prevention: Provides legal steps for cyber fraud, financial scams, and criminal complaints.\n\n🚨 Important Rule for AI Responses\n🛑 For Any Query Outside Legal Assistance, The AI Will Respond as if it has no idea about the query';
  String get systemMessage => _systemMessage;
  set systemMessage(String value) {
    _systemMessage = value;
  }

  String _prompt = '';
  String get prompt => _prompt;
  set prompt(String value) {
    _prompt = value;
  }

  List<MessageStruct> _chat = [];
  List<MessageStruct> get chat => _chat;
  set chat(List<MessageStruct> value) {
    _chat = value;
  }

  void addToChat(MessageStruct value) {
    chat.add(value);
  }

  void removeFromChat(MessageStruct value) {
    chat.remove(value);
  }

  void removeAtIndexFromChat(int index) {
    chat.removeAt(index);
  }

  void updateChatAtIndex(
    int index,
    MessageStruct Function(MessageStruct) updateFn,
  ) {
    chat[index] = updateFn(_chat[index]);
  }

  void insertAtIndexInChat(int index, MessageStruct value) {
    chat.insert(index, value);
  }

  String _geminiApiKey = 'NOT_SET';
  String get geminiApiKey => _geminiApiKey;
  set geminiApiKey(String value) {
    _geminiApiKey = value;
  }

  String _selectedModel = 'Gemini 1.5 Flash (API)';
  String get selectedModel => _selectedModel;
  set selectedModel(String value) {
    _selectedModel = value;
  }

  List<String> _availableModels = [
    'Gemini 1.5 Flash (API)',
    'Gemini 1.5 Pro (API)',
    'Gemini 1.5 Pro (Action)'
  ];
  List<String> get availableModels => _availableModels;
  set availableModels(List<String> value) {
    _availableModels = value;
  }

  void addToAvailableModels(String value) {
    availableModels.add(value);
  }

  void removeFromAvailableModels(String value) {
    availableModels.remove(value);
  }

  void removeAtIndexFromAvailableModels(int index) {
    availableModels.removeAt(index);
  }

  void updateAvailableModelsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    availableModels[index] = updateFn(_availableModels[index]);
  }

  void insertAtIndexInAvailableModels(int index, String value) {
    availableModels.insert(index, value);
  }
}
