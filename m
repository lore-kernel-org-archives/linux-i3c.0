Return-Path: <SRS0=nBCV=RK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29771C10F03
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Mar 2019 09:58:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC54C20684
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Mar 2019 09:58:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g3CYDto5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="G81oNv3A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="JCIkAaWT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC54C20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+iyUky5muSUqv7kAcvg20OOHVeL3+Q99rgPuCrtCPY=; b=g3CYDto5wQto62
	O36HrTqc43lplqa1DwgB+gzNr8Wj4tqA6vOLeAK1rrVMlXkgc6TkyH6m67sR8SuNuXUcM69Jy3sq2
	CXNsHntR9E5wONtiaeOMF0hMR0xT0GFU8UqqhZLXTMqAjqTnet8vkGDfcBMV6FGeoFX217MDQcjSb
	aYrqOV5oG0o5iAxOTeNQ/OXotDeYvDpfNcF+LzaGCSz5jTDlFk/VGVbFMQ56yn3EsHgzZBm6k5fLq
	Oao3qWi0qHLFpehNq9gV9+r0MevOEd99wHcWczo0s0Q37wnePyk7iyB1Y58+10r2TP6w+lAckAw/V
	DBvvWztrjilfXorVh2og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1pnJ-0002M3-L3; Thu, 07 Mar 2019 09:58:29 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1pnF-0002KM-Lg
 for linux-i3c@lists.infradead.org; Thu, 07 Mar 2019 09:58:28 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x279rkwg004684; Thu, 7 Mar 2019 01:58:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=ktud+6kc5lWpfN/SH7lMbIn6GPaAPAYvFVpBctn9XSA=;
 b=G81oNv3AJ5AVZIiHCojBD9aQRtr5EkcIfU94PCe2YrVQHBnfT6DqHPDIThk56aKF+ogC
 Q/T3LP44vW5kJnNAI0SAADssWeJe+/zc5PYCG15uj0t9JCLgeigBYOluVVUkdxMQp3qG
 U4st28SklKAQnhR/CPnihOHy0rm7CJCu/hbU6PRjexqAjiQSPGpU3EGqu97YOlIT7JEl
 j3MGHqeRJCk0gdFhJSJAsNcEkWvQGoEHijakTqfdiyUEmeofnNSO+MiQnaj7+jvyaAAB
 JNJ4o2E55SmQq4l07+WgXMMwZHeQDKNfJxI05ic73c6HaM7b810maqBjsH5mb6NYG56i QQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2059.outbound.protection.outlook.com [104.47.37.59])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qypa00g2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 07 Mar 2019 01:58:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktud+6kc5lWpfN/SH7lMbIn6GPaAPAYvFVpBctn9XSA=;
 b=JCIkAaWTfgf+XnPrLvi76YZ69hWOhNbIeakrJ5Qp3Qin0A5+mxCWFd3ctdKDc22A61CuUeiW9Z/IFU4llWz36MQehHbDgPgjrz0oUbCLohQmYi86kuEb5nyiG98oLi3HIYUisOdIrqCE3PV8wX3qQA4iaLJEfLfkMBP3gwYmEW8=
Received: from BYAPR07CA0094.namprd07.prod.outlook.com (2603:10b6:a03:12b::35)
 by DM3PR07MB2172.namprd07.prod.outlook.com (2a01:111:e400:5980::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1665.19; Thu, 7 Mar
 2019 09:58:20 +0000
Received: from CO1NAM05FT063.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::202) by BYAPR07CA0094.outlook.office365.com
 (2603:10b6:a03:12b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1686.18 via Frontend
 Transport; Thu, 7 Mar 2019 09:58:19 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 CO1NAM05FT063.mail.protection.outlook.com (10.152.96.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.5 via Frontend Transport; Thu, 7 Mar 2019 09:58:19 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x279wFhQ016727
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 7 Mar 2019 01:58:18 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 7 Mar 2019 10:58:17 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 7 Mar 2019 10:58:17 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x279wHrZ023832;
 Thu, 7 Mar 2019 09:58:17 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x279wHg8023826;
 Thu, 7 Mar 2019 09:58:17 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 2/4] i3c: master: cdns: Drop support for I2C 10 bit addresing
 in Cadence I3C master
Date: Thu, 7 Mar 2019 09:58:06 +0000
Message-ID: <20190307095808.22540-3-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190307095808.22540-1-pgaj@cadence.com>
References: <20190307095808.22540-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(396003)(39860400002)(2980300002)(189003)(199004)(36092001)(26005)(2616005)(7636002)(356004)(486006)(6666004)(126002)(11346002)(426003)(446003)(305945005)(476003)(246002)(186003)(86362001)(42186006)(316002)(16586007)(54906003)(8676002)(336012)(51416003)(76176011)(2906002)(26826003)(8936002)(478600001)(87636003)(50226002)(5660300002)(6916009)(2351001)(48376002)(106466001)(50466002)(1076003)(36756003)(105596002)(107886003)(4326008)(5024004)(14444005)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM3PR07MB2172; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31a3a27f-201f-431e-b2ac-08d6a2e36d74
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:DM3PR07MB2172; 
X-MS-TrafficTypeDiagnostic: DM3PR07MB2172:
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2172;
 20:xrxXDO0ghTUolpGKhbMELOMlnu8qA3Uio3j4PWKgGJ8gL+wYv27Cqa+RTxP6M1pD+ycRiIr3UJa7VLBd48s2OlQdtnHGem3iNnbk9lB/B7pMxvroxobJ/tpvAsCUecqffizmGjQZyHyI6oHjEkF1jYO3lBp4uJXF5ODY4QeaFTFbyCbTEcomlxMSZYa2v2z6hXzhVIVAxNGDdtXQmmc9fKG7hinU3yqRFtay1Yk/a/VinkWgiSvrnvIDB4qf2XOoe3pX4r9jqtdwEwQ4LJ9e8Y55eApMGq1Lg4UbNzj7V2B2wAnLbby7cSFwqngJfJn9SDv4R1H+lfb4zDRbFYGJWZGP0wx1GlTxdJdkfjuA6cgm3r+Mg1nu6GWJZ3sWHjmEseM/a9UNgOZc8bKaBVdiv4+331NNa/XTW4l/Vuav32vBm+rMHGzdz3GHFOMXYTofGMGZZdwl/INZt5Jvn+Kg2VsULU4Y7kQj0Fh1O3pLH6CbItyV4LzBQ5+LqYr0oWdK
X-Microsoft-Antispam-PRVS: <DM3PR07MB21724F7D6E646A2CD9C609FBC24C0@DM3PR07MB2172.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096943F07A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM3PR07MB2172;
 23:43vLEUeiHaLVrxd03ekiNGSrTstyxZ0HCuMW1qdsh?=
 =?us-ascii?Q?qc0524nXooMWDSZJRwz7RHDY8mbNiYpTDpOHWdgOb20fnGTZVP3BJhTIr8w9?=
 =?us-ascii?Q?ExVptIT+RCu9YMY4KGyW32/k6cvNEzGYs8+GFeQUWYMXUv7aboRohBdYs1ju?=
 =?us-ascii?Q?A3tJKCG87fXjHKFc2OvV15cA335ohYh6dNr2zQss+timWMSRJ5OlvwVsHsXo?=
 =?us-ascii?Q?+nV4foqnmtdz18tGgMF6CxX/ZZ/nf3xEmrAv6AMcMJMaA/qugJCQLzCVB0pZ?=
 =?us-ascii?Q?0mM41BI9pGWDWwig/HYm5bsYhyxoJ5J9R9WKHDAj8hGZUvb5U/goDhspUrSG?=
 =?us-ascii?Q?9R075ZE7LINHqeV/hPd5jLH+2ECJPLO5nav6y1DqltAtliHXr4HQ2VKhBOj3?=
 =?us-ascii?Q?X//XPA54fyJU38ifQgo/QMDALysVyJfu/C4fjwen/S1cWs5woG/oT2lrcmNE?=
 =?us-ascii?Q?rsuLNvRtTWPE39SzQfQyS/Cu0sYQCbxyTwN+a+EuVwnhwq7JG2o8IoiBqA3I?=
 =?us-ascii?Q?xl/ZaI5+xEL+hL6yUIpb+zRsWmlhw/GPAtlc31s8UGSSEYZR5ofg4hAcc+12?=
 =?us-ascii?Q?FyWyq8WgO60jCrZNFloPv1UgBzBzQAqOd7QuwQGqjBDn81vnvVlMvoyXCyZ6?=
 =?us-ascii?Q?RLyjfV2+XpwTRU6oecsAiIh0pG1JYhx4rL9ZioNTr4Gd6ppG9sqPEaSakqW7?=
 =?us-ascii?Q?MhsbucxP+xn35XOXNkvrz1dPk4QmtrUUw7oqv8MaWCnBm+OalHYwGxOUbVag?=
 =?us-ascii?Q?De8hWRVzXZCxMwsNo7XtHZKbQit1MIa1VcICYL0vBmyxTHzpD26lJTXjQRzv?=
 =?us-ascii?Q?1npJYwDixAMYIcQ/1m8pbJT8BT9HUXzrAjfknQzWcrSVx0UNKL+wPTNn51qe?=
 =?us-ascii?Q?KjQ/D/hzrK0D6tTdUTVJj2qlwLfl4bQQP1HayMRAGfuAXs69/xDCvmW7b7pa?=
 =?us-ascii?Q?fJQSagcUSRf3XyanAwjOYlhM+XwiWAs/MFqUzw4vaO7kpuaay3o5viBD5oit?=
 =?us-ascii?Q?lj1uuDgOeklfTNdQtZANQHJDX5a6Y+POUGGdwJEoWa8rIlFoOepnmrO6UTR5?=
 =?us-ascii?Q?v4QUFQzqDZVJWqkEngFEOdIm+n38GxWEvui5OoE+rhyAF3VSgvs66hHItOsF?=
 =?us-ascii?Q?lBDE1vS8J7lyNGnQiYPLvhnZabcaOSp?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: T2LC949u4W2LUEEhDIJnHHb7Ao0FFChUAa1gtPINtscYJW09Id+2ZWBJrOHGJ3CEak8iTCXuC6U1J+3Xgcst2/2ZtwxxmgKbsOI7pLHQTiMc5IdavEpxb+A4+xhLtaBIbr6ujpty+BULr9fpbcnFWDjc+h6LXTtLbqg3mIKzvLBFMRmpRZo56hHh/aMVhMhSUIshNuefYnYsJiwhHDP59mNXh+/IFhAKdl0FCQQR0fuH9m6Tvz0onO/ZfnYLXc2AZnVs5jYC9PJqw5tO22IH0uqRjyqy3825PqwomJSznL2rfyyrgzKTHL9Drbq3HTuyc04UbhGywmAfO4UvkNEitq77f73vzy8Rs8utRwi8a7vxMf5sGyGdyE6crhRepb6sxS35og6iBm0j/azcAEGLcJE46X6hkTSRLspQ0WD1AFU=
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2172;
 20:+4ru7weSo5BkERBt/FddNF27AwoAzoQdoLTu+fq47NHJo01utHUI5rghqIpLoi91H1lf/4tXLnW7rKkG/ZA140uAxof3JpJbQ95t89tajiTx91BAlDrf9kxSrj7iThWIz1FmSyAOah7Z212ioM7m+vXhp1W4fJzYRLU0HVFa+x8DR9FgfFQmdB8rpaoGDhWKiQi3q9myJFC77+jMhvtiDE7wk45a2OEHXe/RJ4Vmlqmo+nLYW9zKdAAom3WokiS7
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2019 09:58:19.5633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a3a27f-201f-431e-b2ac-08d6a2e36d74
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR07MB2172
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-07_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=690 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903070072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_015825_828812_EADE4791 
X-CRM114-Status: GOOD (  10.82  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, Przemyslaw Gaj <pgaj@cadence.com>,
 rafalc@cadence.com, vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Because this patch series dropped support for 10 bit I2C devices, support is
also dropped in Cadence I3C master driver.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 8889a4f..237f24a 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -864,11 +864,6 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	return ret;
 }
 
-static u32 cdns_i3c_master_i2c_funcs(struct i3c_master_controller *m)
-{
-	return I2C_FUNC_SMBUS_EMUL | I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR;
-}
-
 struct cdns_i3c_i2c_dev_data {
 	u16 id;
 	s16 ibi;
@@ -1010,9 +1005,7 @@ static int cdns_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
 	master->free_rr_slots &= ~BIT(slot);
 	i2c_dev_set_master_data(dev, data);
 
-	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr) |
-	       (dev->boardinfo->base.flags & I2C_CLIENT_TEN ?
-		DEV_ID_RR0_LVR_EXT_ADDR : 0),
+	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr),
 	       master->regs + DEV_ID_RR0(data->id));
 	writel(dev->boardinfo->lvr, master->regs + DEV_ID_RR2(data->id));
 	writel(readl(master->regs + DEVS_CTRL) |
@@ -1518,7 +1511,6 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
 	.send_ccc_cmd = cdns_i3c_master_send_ccc_cmd,
 	.priv_xfers = cdns_i3c_master_priv_xfers,
 	.i2c_xfers = cdns_i3c_master_i2c_xfers,
-	.i2c_funcs = cdns_i3c_master_i2c_funcs,
 	.enable_ibi = cdns_i3c_master_enable_ibi,
 	.disable_ibi = cdns_i3c_master_disable_ibi,
 	.request_ibi = cdns_i3c_master_request_ibi,
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
