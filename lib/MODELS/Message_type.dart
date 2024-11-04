// message_types.dart

/// A class to represent the various message types and their associated codes.
class MessageType {
  static const int socketError = 1;
  static const int loginRequest = 11;
  static const int loginResponse = 12;
  static const int resetPasswordRequest = 13;
  static const int resetPasswordResponse = 14;
  static const int versionMismatchError = 15;
  static const int addPortfolioReq = 21;
  static const int addPortfolio = 22;
  static const int modifyPortfolio = 23;
  static const int modifyPortfolioResponse = 24;
  static const int portfolioStarted = 25;
  static const int portfolioStartResponse = 26;
  static const int portfolioStopped = 27;
  static const int portfolioStopResponse = 28;
  static const int deletePortfolio = 29;
  static const int portfolioDisabledResponse = 30;
  static const int orderResponse = 31;
  static const int tradeResponse = 32;
  static const int modCancelOrderBookResponse = 33;
  static const int orderModificationRequest = 34;
  static const int orderModificationResponse = 35;
  static const int orderCancellationRequest = 36;
  static const int orderCancellationResponse = 37;
  static const int newOrderRequest = 38;
  static const int newOrderResponse = 39;
  static const int iocOrderResponse = 40;
  static const int marketSpread = 41;
  static const int ltpPacket = 42;
  static const int netPosition = 43;
  static const int fastFeed = 44;
  static const int portfolioTradeResponse = 45;
  static const int tokenData = 50;
  static const int loginResponseEnd = 51;
  static const int newSpread = 52;
  static const int rmsLimitUpdateRequest = 201;
  static const int rmsLimitUpdateResponse = 202;
  static const int rmsUtilization = 203;
  static const int limitSetDataRequest = 204;
  static const int limitSetDataResponse = 205;
  static const int limitSetDataUnsolicitedResponse = 206;
  static const int limitUtilizedDataUnsolicitedResponse = 207;
  static const int additionalFieldsPortfolio = 53;
  static const int newOrderCASHRequest = 60;
  static const int newOrderCASHResponse = 61;
  static const int modOrderCASHRequest = 62;
  static const int modOrderCASHResponse = 63;
  static const int cancelOrderCASHRequest = 64;
  static const int cancelOrderCASHResponse = 65;
}
