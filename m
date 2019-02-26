Return-Path: <SRS0=oKuo=RB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A219C43381
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 14:29:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17EBB21841
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 14:29:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lK2US45Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="j6mGgxKa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="os3T163x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17EBB21841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQt2FWUK2qdjgYhRZP/93p54wDV28WPs/W19soF9TAE=; b=lK2US45Y3xXzXa
	qxw7p3VlZokjsyBhFf/ZAczKTPplv2huJykEdV2ySdSyv8utyc2DzzB4eT//B4t+nzet+2ZuD4Dn2
	eRK6rsjrsHIeYbwTxWmmCCnWwQEh9o+LUO2dw4ztgzZGC+86YiMhHLMfmMncTRJbtuEGY+VyocHz2
	UnFRH81njVzvozxhX2VecyT85fU3TW0DBKtPHr7WxsmGnrTNdiGl7/Y1pH6w6LudPq25OseRtewzd
	BJdSwxWtwFpjHMuXQg81LIhOdsnG4ZJLHYQTG17Pj7ttpv9gpdjCzJ8955I0m/powG+s5ECg+LZJV
	7h1yWtPsPbo/76lLSW6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gydjK-0004NB-PC; Tue, 26 Feb 2019 14:29:10 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gydjI-0004ME-E4
 for linux-i3c@lists.infradead.org; Tue, 26 Feb 2019 14:29:09 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1QESnce002483; Tue, 26 Feb 2019 06:29:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=DWmVzzRniBlQalGqvuigQMbLt0nLfKSvL5tv5Qdg75g=;
 b=j6mGgxKa0RgajX9whLlmkKah5NyxpJ3ROhGXen2l5Dfsd9Jc5jEnqWtgufZ6X/Qc63ft
 SpdlsRBeDG/7+INk3LRktovcGbSYjUaBiNMdXPWzv8/9klf3mNtdvgQoZCnWzwIwG2iE
 0bcp8MSIIkWTMx26fpSNdf+yoskcxtAcS8tlQKrRfOiDWqBa3IZAOo6j27K82NiLEhgz
 Irzo4HvrLU5ZrdgJq4ZlhfP6AJtJWYMFLafVuRSoD5TART+6fT5PmBTCN7388QgNoHqo
 0IRG6UrzYjt1q5FsZu4gGqKZch0hzAoCc9rqwrKWX8N85nK1hezfeXPo3A5R/ENf86Kq KA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-by2-obe.outbound.protection.outlook.com
 (mail-by2nam05lp2055.outbound.protection.outlook.com [104.47.50.55])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qw2yrh4jg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Feb 2019 06:29:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWmVzzRniBlQalGqvuigQMbLt0nLfKSvL5tv5Qdg75g=;
 b=os3T163xRCwDet5Z5eqLg3qUn1JRhiz5+MJHRZo7ZaNnPN2i5VV/QTdjObSPG+aHphhyaC44Ccgtvd+/nYqyKENbEPdcQcVcMNCg4eZ6FsdvfG5pqzyWtRELmgU6SKmJUAqvD4FjQwNHpdtQBRc8iV+YPZ/EeuVC5IxWUzX/cM4=
Received: from CO2PR07CA0051.namprd07.prod.outlook.com (2603:10b6:100::19) by
 CY4PR07MB3095.namprd07.prod.outlook.com (2603:10b6:903:cf::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.18; Tue, 26 Feb 2019 14:29:02 +0000
Received: from DM3NAM05FT034.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::208) by CO2PR07CA0051.outlook.office365.com
 (2603:10b6:100::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.14 via Frontend
 Transport; Tue, 26 Feb 2019 14:29:01 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM3NAM05FT034.mail.protection.outlook.com (10.152.98.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1665.5 via Frontend Transport; Tue, 26 Feb 2019 14:29:01 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1QESx7F014080
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 26 Feb 2019 06:29:00 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 26 Feb 2019 15:28:58 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 26 Feb 2019 15:28:58 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1QESwXh029301;
 Tue, 26 Feb 2019 14:28:58 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1QESvgD029299;
 Tue, 26 Feb 2019 14:28:57 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v2 2/3] i3c: master: cdns: Drop support for I2C 10 bit
 addresing in Cadence I3C master
Date: Tue, 26 Feb 2019 14:28:45 +0000
Message-ID: <20190226142846.28294-3-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190226142846.28294-1-pgaj@cadence.com>
References: <20190226142846.28294-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(396003)(376002)(136003)(39860400002)(346002)(2980300002)(189003)(199004)(36092001)(316002)(16586007)(4326008)(42186006)(54906003)(107886003)(50466002)(2351001)(47776003)(106466001)(105596002)(36756003)(6916009)(4744005)(76176011)(51416003)(305945005)(7636002)(2616005)(476003)(126002)(11346002)(486006)(446003)(1076003)(336012)(50226002)(8936002)(426003)(5024004)(5660300002)(2906002)(186003)(26826003)(356004)(87636003)(26005)(478600001)(6666004)(48376002)(8676002)(246002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR07MB3095; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b204413a-7051-4169-e1dd-08d69bf6c0b1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:CY4PR07MB3095; 
X-MS-TrafficTypeDiagnostic: CY4PR07MB3095:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR07MB3095;
 20:eP4IiZdzTmLugEteGaU8OlRvKfG208OYDnEYs+gddC2eLwUnxII2NjxNOXtXlQDVmxHG8dl1+hnUvI4s8B6X7VtsJpV5qrsjvNhziByPs8R3JJSvjDdN/xDwNewMIhjqPfOMtu7JZBB4UI3+aBPlnSXoJtO5vD48sdtgEz6cazHBZZgE2XYQwIaSU5ACeVhUeDdktzkusRNGwqE0KXm6LhUOLCM0W/0SN//zy1NCLSUP54czYAC21vovBd6jBwCJ3anpLJbzbEQhBrVXfO2jyEb8ynnTJORsoZ3UACo6fI1Bqgc62cEso8r9d1a0RESS7AbcuQaQNY7ftKTa4E7R4zpZ00v4ame9yecp8FVkLYtrFtwzwRNt6mRPwzhjBwsdjAnnVXjPqeHL512osKL4tKnmUT/b/y3mUVStWOL2xpSJEEySOtTNow4ym1iL7pFOpOtdqr9VvD1GJW0IWwh3bDEtsmaB5UuAjcD1Gui0IoQUpANEnWyZn7h98y45cimF
X-Microsoft-Antispam-PRVS: <CY4PR07MB30951DAC26CD1CB6E9F3DEC5C27B0@CY4PR07MB3095.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096029FF66
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR07MB3095;
 23:Ltn4jgHb+LIIJIwSJVVBrGQJMGfB71ktPFShJXd0s?=
 =?us-ascii?Q?oKIzf7cVRc/nKqnYGrTvzM+3LUSlSzXcxw3+6YBGAEXFDMnim52XV37JWYTF?=
 =?us-ascii?Q?VPEYKEtpuquxnAXNr6J28zzNoKs1fOGeiMWPLNc2CuB4l3O1kmI9LcXbd64D?=
 =?us-ascii?Q?Y5LVgFbwc7LtNyT5lsYNLAd+MWtf1ppsGvxzFTwWTSvlXphw8B3Rwp6fIaHQ?=
 =?us-ascii?Q?61hV+JQ7WARjm9jDY5klyoI18yhkiXtF/CLduCRDVkq9VO1OummUdP3iq2ic?=
 =?us-ascii?Q?Psq7swqi21cBzjdCzcRNxBv27JdENQZ7u3IDAHzsfZXFgRWiq1nU0O4xTbB/?=
 =?us-ascii?Q?XH3G2IFOlAElONe8INmo84ZhzVEOnIaHvs+hxF+qtIkBIeWE2iBUa4EsXiP4?=
 =?us-ascii?Q?2RkamcqUzXarqTdz8mgEBoiubhwTMXZBNo5Np+EJZ/7ZuAD1Ha96c7+40eu2?=
 =?us-ascii?Q?mIOtanjAWe3GJqXH/V7CO3HWw0v490XCnsWzks647XVA/+QbUOOZRm7tTHty?=
 =?us-ascii?Q?/2GBoac+xAqwePPWxGZUw2s2V0cD7i0C7ArFMKUErz9phhZZqHst5l8+mLcq?=
 =?us-ascii?Q?JfOro9FZUVeYr72XY5iPiLX/GzK8ZKKZJd62LcDU4XeC+U44tla0TN2KU9Pa?=
 =?us-ascii?Q?GustvMYLH4knf5dI6jHbpBKM70+VzRuzuNctcfFSBB2dnJnrJpXBurOKD5p6?=
 =?us-ascii?Q?jdgoQpXyS9i87fSe3Qm/LMeVE2tBTI6YdsCF3Jv64OSTPhbRIP0J/xKbXxV5?=
 =?us-ascii?Q?bYVb3ymfHXkvhxJVYaGTCIY+RjGFpF3Jf5KIzajWn1Myo9t1z8llx6YQ/J5p?=
 =?us-ascii?Q?2d0dkXvXNdPy6J5WY0616CwSGhHza1XHsWcCsAW9JIx1pJ3eW3F53hEddVGk?=
 =?us-ascii?Q?1E1Cw1a+MRXnI8iNBG1tTBxqrCbpaBfxUfsQawZdOwZ/JiTuaiwx9dx2PTU8?=
 =?us-ascii?Q?1z7N6NWZrpg8RxEapv/8xfUUGs7ZuiitT0bc2Fpa+sejDn4tryxt6h7/Jc7P?=
 =?us-ascii?Q?dYl611RCArMgd5QCBe2B6wK5TilI+ObhDEtHGxBBtT14FfYOQZxa1H3Wzh6J?=
 =?us-ascii?Q?BvjuHR3ErKqScnZihN9b2WBVTagynldQ93YVeT5WgbSgsIuKfOAtGehtlkfa?=
 =?us-ascii?Q?Xi8Tup1Q5UyKGhugd0tTIhpYm25L/cw?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /c/3vlGWcLQvLw5N7PYvzm0SK7nNsmMJpVJnDhhP27Psp2YoCyaQnpK/TTWZgxDwtDYBpyaQ1Ea4zLqVpod7CJS+YYcbGbSw680GmKGKh0eopuTriB+9QVDnnjyAYzhs51GJl6Cwe0Pcp7Y99qOlsH2hKD0IhP8SWimSdhzWjxbqUob9farDKhxOcX7G8IFiuNw83q1vCAbiMqNJNHZ98kkitnU/5w1pj5z5+b0tUcWFq/fivZWfx8lNk+rZ9/RiOPkkc5I8mf5tylFaerpp4p/tAAQy5BBr+KLN5TXcBDoqhd8LPhOfDHQD9AOZPZPI8EkQeuh1Y3XjE819lvzw+B50ErVQSp9MZ7DDaH+Ue7KEhNMXiXsuzON0/aHKCoFIgGsAPdZw0Id/Jrm3DKuZzzisGRtN0MkUJuFqLRVgth4=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR07MB3095;
 20:Dv6WELoE1g9Fsqv9yp20zxw4IYjwCtnFeco+DPhUcUorGCCmmG7avRVKnmGoQp/uveu7pIoZiRYpshO2TeJB2UrN2xkZ9QzsoqlJ04JAnkibM8n/33M2IJLyD6xQePHM4/OdwvTdRNfM0IetjSmIysOsNQzEGhy3xe/X0zpvTqUF90u5yJK8vQR/WUIRzBAy3E04MXEePzgyQkAkkU/mXsdlnBSIcY2jWULCnidCYtI46gwV6/YGiaPdBV+TxG49
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2019 14:29:01.2803 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b204413a-7051-4169-e1dd-08d69bf6c0b1
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR07MB3095
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-26_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=680 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902260106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_062908_589941_766A419B 
X-CRM114-Status: GOOD (  10.99  )
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
 drivers/i3c/master/i3c-master-cdns.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 8889a4f..1797fbf 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1010,9 +1010,7 @@ static int cdns_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
 	master->free_rr_slots &= ~BIT(slot);
 	i2c_dev_set_master_data(dev, data);
 
-	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr) |
-	       (dev->boardinfo->base.flags & I2C_CLIENT_TEN ?
-		DEV_ID_RR0_LVR_EXT_ADDR : 0),
+	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr),
 	       master->regs + DEV_ID_RR0(data->id));
 	writel(dev->boardinfo->lvr, master->regs + DEV_ID_RR2(data->id));
 	writel(readl(master->regs + DEVS_CTRL) |
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
