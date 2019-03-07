Return-Path: <SRS0=nBCV=RK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695B0C4360F
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Mar 2019 09:58:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3732820684
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Mar 2019 09:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FJgT1Ivc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="Cl/dI0+N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="sZRem1b0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3732820684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42m3lw9vq0ZHef6I578/cyQBmLgKdYdWYr+m/P2bpV8=; b=FJgT1IvconRBKb
	zHemVlLpKZkLVLmWe1w729W4miCsIGP6y/b23JY3kRGUzzpAW5FSvQhG7QmQEchTfkIpq7gISVFMR
	RKW42poLdJ/xQu9gH8vrvMUS8YzwoWGVfof1ik9TPcxhNyH9wfMLC8mXBZjG7PvfrYjA/4V/XyKnL
	p+F7W8ca3v+ETF7+vpn3140RwQVH/P5tb2zJjtmo+BExVwJtZwYxH+5UIJQmcTMvb6cmf+i267Vxw
	NsJE99hQG3jY7zaz38vzM7n4KI0oJ/wiucyXsNiZUwrDlsd5Sw6+d/1j1l9bs0Gi8e7i0ZpsAxiSb
	Q+kwz6L/cRmZf4Up2I9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1pnL-0002NJ-NW; Thu, 07 Mar 2019 09:58:31 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1pnI-0002LT-U0
 for linux-i3c@lists.infradead.org; Thu, 07 Mar 2019 09:58:30 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x279vSEM017793; Thu, 7 Mar 2019 01:58:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=iXcjCIyR+I5SxaSkc0yCUBbklPT8mgOTx8o7/XqEajE=;
 b=Cl/dI0+NMYbFOFKucLoRVVJKoqOeB2rFLTfhjzTGcbaJ/8dVho4KsQMHSQyjj02p1L8E
 Z1Jiv5gLHAEyViShofAyxm4D2uuGhDYaKkw3DHdk4iNu47td/+PuUpbcM3fYllXtOc9A
 UjLeWliXhc6nOn0hhnbH659rqi9cWTqC5ZWFbdETohuk2eLLFA1esR4hhUU5mVue4v0a
 RT/n+vhK1Xci7R+mJ/cmnm3Q1B1hGxIrbYKLMrsAuvXPqRhu3KbfPmGZ8QlSgUl/cOkO
 Roskx+4ai1x0JI3NC+wjhqE/SB7JU2nahPAE475q92MZXnR2bQLyZdnbfdf7d5sFE14m ZQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2051.outbound.protection.outlook.com [104.47.37.51])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2r2bec67ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 07 Mar 2019 01:58:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXcjCIyR+I5SxaSkc0yCUBbklPT8mgOTx8o7/XqEajE=;
 b=sZRem1b0gLwUO35uQWQP5cE3FjnM0LmddxC8SWdz6FNftGbsUS98sfGzdTVRPhGH128laCHkX8BDVE31O+naai3nMLQdHFEhjVy2PWvWKwa9UkNSFEIfhNeKFqGv4vkEtg0pj+UMqlyYm9B15RqgSSSgxxZMgZ+3MyOCIN8yNcc=
Received: from DM6PR07CA0054.namprd07.prod.outlook.com (20.177.221.31) by
 BYAPR07MB4406.namprd07.prod.outlook.com (52.135.224.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.18; Thu, 7 Mar 2019 09:58:23 +0000
Received: from CO1NAM05FT032.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::205) by DM6PR07CA0054.outlook.office365.com
 (2603:10b6:5:74::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1686.18 via Frontend
 Transport; Thu, 7 Mar 2019 09:58:23 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT032.mail.protection.outlook.com (10.152.96.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1686.5 via Frontend Transport; Thu, 7 Mar 2019 09:58:23 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x279wJZ4031683
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 7 Mar 2019 04:58:21 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 7 Mar 2019 10:58:18 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 7 Mar 2019 10:58:18 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x279wIXn023884;
 Thu, 7 Mar 2019 09:58:18 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x279wIde023883;
 Thu, 7 Mar 2019 09:58:18 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 3/4] i3c: master: dw-i3c-master: Remove i2c_funcs hook
 implementation
Date: Thu, 7 Mar 2019 09:58:07 +0000
Message-ID: <20190307095808.22540-4-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190307095808.22540-1-pgaj@cadence.com>
References: <20190307095808.22540-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(136003)(376002)(2980300002)(189003)(199004)(36092001)(81156014)(2906002)(68736007)(26005)(106466001)(8936002)(1076003)(50226002)(54906003)(8676002)(76176011)(81166006)(486006)(126002)(86362001)(11346002)(476003)(69596002)(6666004)(16586007)(5660300002)(36756003)(53936002)(6916009)(107886003)(2351001)(446003)(97736004)(50466002)(316002)(5024004)(2616005)(356004)(48376002)(336012)(426003)(42186006)(478600001)(26826003)(87636003)(305945005)(105596002)(47776003)(51416003)(186003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB4406; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b156ac05-deef-4032-14c1-08d6a2e36f9f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:BYAPR07MB4406; 
X-MS-TrafficTypeDiagnostic: BYAPR07MB4406:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR07MB4406;
 20:i3DMek4kM2qJRu5W1n0LUNTlPDOsrb3xrPkjE+CLYVbBlFe4oZ5oQsgwm2tXyxogGw2EUupiCL5aYE2wa+XNwIVjAA8CGReavASOiqIbvivXTR/KOdOen8TkMW3yg2e/p5tO+nuuK6uMb61ZRNuny3RELRAVKt+08WlZZ+/leH9fK88Xl63KI9Z8uYg5+F2bSUZ1wCS+CVC/KXyV1OhJxcGKAl6daXCh/260Rn4LvLfYiQRb3/6Oaad0kua470PdXki4jJwn07182NMr81oDo2d1Q5hV2c3jNZxQ65zoP2cHmVluJctDPA+91w2+YUFILld7gMXXZQ42RLXVK+v3RI/UYcTXFlJLdA5qnqzUMb+s0Nxt6QUy0UHLqLmS1bDnUykE8N6ioGpD2r1mKvkiIQXyw5iaqBGhMtTAVulLxX6jZSncjhp+iPsiIUXLshTwd3t3rWInSA+ZiWJP+1p3wMyLhgQHh9yd38t7mcmxpqQdcoZBeBr/Cu8glhhr1pP7
X-Microsoft-Antispam-PRVS: <BYAPR07MB4406CE8D3E0D1B94B7BF68F6C24C0@BYAPR07MB4406.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096943F07A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR07MB4406;
 23:89QAfkFfotdIPnTGyYhi3X/qxm4JkO33lr/r12LCG?=
 =?us-ascii?Q?+2/9liETa+gbVPqQ2x5OCCvJePtfy9Fc9vrHPlkhM/nfhr0DqXjlGzP1ZH3p?=
 =?us-ascii?Q?jak5uGPxzNJmEtC+kS0SZ9A6mdM3/govMJhl0XSK/z8jNgG9BY1tUKlDD1bk?=
 =?us-ascii?Q?NqCDv07WxQIoR0g7N1nLqBA0YncinmN4ljPyoj7pqs6oxMrrzu1dawhHZDjB?=
 =?us-ascii?Q?uFsdW97FOgBn27vTSwNcAnafnAHqdqecAJPvwCUWIwHjf/h4e1QhTJPsenBr?=
 =?us-ascii?Q?bHbl/o3kqihWZH9phUXpqewZmOMEyWX0enzAkGtO1HE374xnpyIg9ShZdlOd?=
 =?us-ascii?Q?slQ6eIy7vyR2WFHoxxPJbxRnu7np4PztpDQJldsTWgrnWO5q8NB5uBXAG1b7?=
 =?us-ascii?Q?uk3wFypgn0vOWeOtfpuD7k04XNrNBpSxs74C6AkHt9mXi1/IEfT07hoILUHn?=
 =?us-ascii?Q?hC7J64Ss9gy4Ytw9g5PgDpRy7u75ubGwKOFOcSWt2/HrVlzQcOMWVKDbmfSw?=
 =?us-ascii?Q?WRmCN08qWxLdN3dFL7ZtAf2VFe+BtlIJyhVui+KjY909RSwulmogH3YKwy1o?=
 =?us-ascii?Q?b9F5PjEL/2pnO+oDlmrJNpCIGuCXBha4zRbnJGs1KD6gniK80jSSLehkMBJQ?=
 =?us-ascii?Q?dH23/1pdzfXk+7yfAUTbqvP8cfkdqDWaJBGVLzLr+GBvlYFZCk+fsYE2uMlX?=
 =?us-ascii?Q?W/eFPCQXqRHwRXNPLZyeq5CMQIxPCZrJrPO8R5wVwXRaHSV5XX0aQQkqhmCH?=
 =?us-ascii?Q?/VUX46Q+Uk1WHfrx2rbzq2Ol0U4oNTaafV2laPbHmeGlget2CAq4kaF+p76p?=
 =?us-ascii?Q?yus50NHB7FyRXw5ADnc1MRQoN+sbt3qppu0caiuoXLew3UZ5MT8oiv9VdO0q?=
 =?us-ascii?Q?JVBd+gwlhD4dPRYYPGQ8cVaL/Azckzw/GBtgI+xKrJFdDMBrmZPdJyNJBh7n?=
 =?us-ascii?Q?k/R3QgXZA9eMiyWuBopUgwKusWozSonSAtB/emmkAjqlWB/a4r5YOX1LTELY?=
 =?us-ascii?Q?svlH4LSZffa0LgIno/vxGceoIoUwUWVS2oiBLk2B95HgHI5eSqtQWRiF8BOX?=
 =?us-ascii?Q?BI84qWoUoJ+nhKhc9CodLU8LD6v2iHJldKSRX42deODg8MG8uKb88fAww6wg?=
 =?us-ascii?Q?byLDoDY6oMMqS9C0zVTjM1CyqK+WJesGqbgyrVmXWuPTvOe9S8Ve+m3x0Ul5?=
 =?us-ascii?Q?sCjLtK562VuNK9ADVWKeAYKH6KHW9N90XTBHLeBgVmffKwz2lwl1KdFgw=3D?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /4SjAyNSSgcABr5yPlGPujGnY0dYZjcfxloab9V/yqGWDGFpGVmtmDcxIBKWG/BG5IGPAJStXDlnI6on/wuq6HWGngvizuFs6d69ZeIbskSFm9wBeCLXrnvaoGS5ejV69K7ZZ4NxZbEx+pFryJ3ulnHjg27dnzFpbPjVfxamSbKmV9HcF2RWZG1vOW8WES2oIS+rpPu0TiioWRqG2j/WaTuKX0iVrkMvGnxQEgxfug+uD23G2pot/GyJ2HUYqTx2RLUzqMA83JnkjZReOm9k9EkNm9IavqwxqKqK6qB8EQHJK5Zt0VdNdccZMPsWQo1iNq88/L/r9rrOjDi5Exmj+Vo2c8eTsJBX5GUQ02KV67C+wk7mE/b3/9QBDSXDdyrFc5X1oqJ52ISh7CGkeuV4u/kP71usj7PSOQrkEJv0YWU=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR07MB4406;
 20:zAPiSNaRlDWUfAMm8O3oznNpK+CGel02Unna4VVi1AGLxwvYxqM2q7yptlCzW0xusC6wjVMZ+QzRH33qaf+PEUpRTGEAIQlkRZwK+LUi7VUS/OGgBo+sQl70OWtOrn7j+3YZMMwMCzKElqQbOdRrUzeGOy3FwuWJRECkulaQ9qqHB/dJ90YmLcWfD/F3OrN7QsGWc9ioMKqMgSv2D3kWYYb4Q5LHxIjNzwFsVmfckDzukM7e6Zu3LvNK/6IUHhgH
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2019 09:58:23.0363 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b156ac05-deef-4032-14c1-08d6a2e36f9f
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4406
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-07_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903070072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_015829_086722_40AC777B 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

Because this patch series dropped support for 10 bit I2C devices, i2c_funcs()
hook has been removed. I removed hook implementation from Synopsys DesignWare
I3C master driver.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master/dw-i3c-master.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index bb03079..9934a12 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1069,11 +1069,6 @@ static void dw_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
 	kfree(data);
 }
 
-static u32 dw_i3c_master_i2c_funcs(struct i3c_master_controller *m)
-{
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
-}
-
 static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 {
 	struct dw_i3c_master *master = dev_id;
@@ -1108,7 +1103,6 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.attach_i2c_dev = dw_i3c_master_attach_i2c_dev,
 	.detach_i2c_dev = dw_i3c_master_detach_i2c_dev,
 	.i2c_xfers = dw_i3c_master_i2c_xfers,
-	.i2c_funcs = dw_i3c_master_i2c_funcs,
 };
 
 static int dw_i3c_probe(struct platform_device *pdev)
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
