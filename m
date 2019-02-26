Return-Path: <SRS0=oKuo=RB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EFCC43381
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 11:01:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4493020842
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 11:01:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="smoCsWQU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="fPob3qJE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="HV0OYWEa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4493020842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMheZKRperI3WRd1gLzwJ02PfVYzyq9Ntq30BElrSAk=; b=smoCsWQUx339CT
	G3p+rLqb3jD9cycPCoCisZOnpiyvNUauqmeW0V2EYDwELO0n2eEGyT5WXzqAsGnCYhHXK+oGTM/JF
	Nt0O2NG8TmrkePbrVlmxk3hcU7nGvuqT8G/J6uRRpRzd7Jo7IxdmpvyEB0DCMKZGpcXHg9hBTP94u
	BwrBBJxbz3u6QalAdC4GE09YOMZpd64XmHoDq4yjr8G6dWqSOX6xpUK6RvL7AUe0qnUQQsfc2J43M
	TbUgYQUENDLchquhONEHKz4dHMQ5N6x0o5RbfpwbdITYnWraYwjAAb49uJbSeVi42it2h7yN3QanZ
	ezanKNmsBOJru76h1pvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyaTy-00059c-Uj; Tue, 26 Feb 2019 11:01:06 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyaTr-00057m-Gq
 for linux-i3c@lists.infradead.org; Tue, 26 Feb 2019 11:01:05 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1QAmo4s025195; Tue, 26 Feb 2019 03:00:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=sBRl1J1ZFNQV711UZqVNa+gV8laFTeIzU5kQ64ZvYUQ=;
 b=fPob3qJE0qe7qFAQzqwNNGef9UbWdaPHzfNFf0WxNYHwVPk9c2DQAyT5+pcbfYzapm2p
 FmxTCt9t85vZGOKO/MhmGccgtODZeTW/lMoQ2YGvYzwx86UFiMX0zjzrahlSwLHbtJWj
 D4ID96k49vjQRICqxCn0uosSoCc80t0qroSa2O6QG0bhfIvlPh/FXjucObW9N49w1WOQ
 bTV9pjWLP9SxUfJeK85npDbq5wpfUMdqcp7pwYQk6kr3cRAn4kq1l78SLXNvy+v42H6l
 kOGOWIv2QaV/3aynd1KIJnHaCJJ0O3t7itIPlQ70ednzUts4bJLogtm83pJ7KMSI9Af5 BA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-by2-obe.outbound.protection.outlook.com
 (mail-by2nam05lp2056.outbound.protection.outlook.com [104.47.50.56])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qw2yrgac4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Feb 2019 03:00:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBRl1J1ZFNQV711UZqVNa+gV8laFTeIzU5kQ64ZvYUQ=;
 b=HV0OYWEaLJuREZUeNfVwc12vUEO3TeaOqpQmFcVgSOTJPuNcOK2xCd4mUqNat/+Rhm4b/jLiHTmV7+Zf1pp4utlcQ+QBKhoQ9g9NDDoFRtmW3TaIskUC9qcv4zijDlNWmNSSYsPOvcdlR9wOcrnnvysVKq5z8seiaQjs5s8JA5E=
Received: from DM6PR07CA0057.namprd07.prod.outlook.com (2603:10b6:5:74::34) by
 BN6PR07MB3090.namprd07.prod.outlook.com (2603:10b6:404:a5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.14; Tue, 26 Feb 2019 11:00:53 +0000
Received: from DM3NAM05FT018.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::207) by DM6PR07CA0057.outlook.office365.com
 (2603:10b6:5:74::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.16 via Frontend
 Transport; Tue, 26 Feb 2019 11:00:52 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM3NAM05FT018.mail.protection.outlook.com (10.152.98.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1665.5 via Frontend Transport; Tue, 26 Feb 2019 11:00:52 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1QB0lJ1020681
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 26 Feb 2019 03:00:50 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 26 Feb 2019 12:00:47 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 26 Feb 2019 12:00:46 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1QB0kUm016564;
 Tue, 26 Feb 2019 11:00:46 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1QB0kDt016559;
 Tue, 26 Feb 2019 11:00:46 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 1/3] i3c: Drop support for I2C 10 bit addresing
Date: Tue, 26 Feb 2019 11:00:01 +0000
Message-ID: <20190226110003.5909-2-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190226110003.5909-1-pgaj@cadence.com>
References: <20190226110003.5909-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(979002)(346002)(396003)(136003)(39860400002)(376002)(2980300002)(189003)(199004)(36092001)(356004)(2906002)(105596002)(6666004)(51416003)(126002)(336012)(2351001)(426003)(76176011)(11346002)(2616005)(446003)(476003)(54906003)(5660300002)(26826003)(87636003)(106466001)(26005)(486006)(478600001)(36756003)(186003)(4326008)(316002)(50226002)(42186006)(50466002)(16586007)(48376002)(1076003)(305945005)(7636002)(246002)(8936002)(86362001)(107886003)(4744005)(6916009)(8676002)(47776003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR07MB3090; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72e4543b-b2f7-4f3c-b7a7-08d69bd9aca2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:BN6PR07MB3090; 
X-MS-TrafficTypeDiagnostic: BN6PR07MB3090:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR07MB3090;
 20:e/in3VXn63Qem/Gry011KAwtxcdbWs2ljxl2KPEYoy1KRMbQ0H0ATg/O8a8BBj/fmh1kiKk96SPpvZe3gEM991pS68n/4s2Pwn8E4wSdJbR/aLUmo4Zqk4lqIMiD6mwM6h85lEn/L9n28HsAtOxmtKVEBoTHhdBAx9LlLryys3WAJi8LjvA0KMuMKsaCEyFu3yzMNaGPs8esQCv6eJIBS3/GJrAszoA6xYBDwWqZKpI2MBdKmSc4g4V4Fsk2Du4GOhpA0Q01R+w/y4pkh7/G9PTI3WdKYqZoFlPfzHgRhjEC4HwbMqbHZuITydO5pTo7GK04JEUgIXowS+TchWGJQ88WEzKmTUeZyKb8+C31tLqcKKwWzWT4BTxd8w4yq9nHuBkB0JisjUcPGixJd42W17W+YsEgu+UIlYVm6Lqesx6ktTv0Ju/+zQcTcjUpPXFIi4ek4OZsWYGZu4AexoiYJD3IAAKNypgcFnGa2nhnmOg9HfV4ki/bKhLXzq4OAFb+
X-Microsoft-Antispam-PRVS: <BN6PR07MB3090F98733915E198AE17D56C27B0@BN6PR07MB3090.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096029FF66
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR07MB3090;
 23:5VBC7clGBlbQmz1wIAw+yrJkKrepspQidIaJ+DujW?=
 =?us-ascii?Q?HmmfH0WVHOEt6faKCxGpTcqlrnRme+hbs2jghBtd9hAUViwc6oZBtC8EzlBt?=
 =?us-ascii?Q?0Gw23J25sWR4WrxU2aRVkr0qMUx9B4pD4vaNbtBdd52dfeALgnsy6yaxHqkz?=
 =?us-ascii?Q?qzGpidSQgPYkT3jBix2udX5zmDy59kXqIrS5hz0xH3YtfLWpNggn2InzNEpe?=
 =?us-ascii?Q?1wllL0pzvUw+2fsT6aZ1PKUGvKbkBitCB6knNzqOWTQdNjlYccK7ESuiIRBP?=
 =?us-ascii?Q?zC1AVh77Z4pm4Ba1ex1RMIURYvKTN260mjwQT7W+AljZ06f6oxZvDoH2ciT5?=
 =?us-ascii?Q?sg7noOBb04Q/jOkVgy1v78hnNhjKLowySxNwhWHHuaWD4MmyjmE6kGuV28EM?=
 =?us-ascii?Q?N0Q+/gPpXG8V88J2g4/JzrVZ6md/2Is8UWKT5N+rbBlPePrioFQl+whSKcPK?=
 =?us-ascii?Q?fB8H5IZlCbgtggxN8sC+sSfH/mtuAR196QO48ZL5RfvAdgkuVT3167gy7TKa?=
 =?us-ascii?Q?M2G4ITeISbSYgVwJlMUqywXNLUMLvz0VxpHIdGqAIHhufyOkLz52b5nrauoK?=
 =?us-ascii?Q?x+i3CQTJuvGgLT9rlzhk/i2+sQDqWX8vnhP7vSGCifLTAIapGAQqGOw/198p?=
 =?us-ascii?Q?XkdbAOJRWH7xw5dk4Otu3f0+twL+MTApvAY/7swRAjOZvKxJfJyTiVlLhs/o?=
 =?us-ascii?Q?+PUh1V0m2TkbdZ+HVEUR90nDv/ZXA3Od5+EzrztuXAUAh9h2JoKWVOL6o6Nk?=
 =?us-ascii?Q?uQePBhCSJ/0ZF4w8NQajQIUr3AfENaeF4X1ip2ZOOGCb0vNDTxQrLVVcuXeD?=
 =?us-ascii?Q?UBFVG1I0eOlnu+od/MfGYWPOvLsNgh73tQK9XvCvE+DpWMYmQos4g0avb4/3?=
 =?us-ascii?Q?dvU3BspuCEBev/Qkb3MpBHMszVHz5j/rASBXuWNHUqViHwZ9t97R9+TePVDA?=
 =?us-ascii?Q?K8dBDeaAJhALpDKi4+Z2JZSrr7h6srcsr5GFdSib8dkuaJUklzjRULtsi0LN?=
 =?us-ascii?Q?AvgJ+W9lG7jCtWDgKbMnU+Vsp2MbLnmLMDuqruMJnhF/0hgVEnPMmlhGTAPM?=
 =?us-ascii?Q?AZptH6EWIiWvO4dYvI3fvsNJI+xk9lRPTfLCvAwkb8roP6H2q+Qj9L13zWSN?=
 =?us-ascii?Q?jCxY4Z6U/9WkPeUrqOShn/3rCEcy88vlzXWdVqmT7iTL0pjGBYwPlHCG+oGj?=
 =?us-ascii?Q?EVJk+fSWGWTBVZ8h64sN/X7Nyz4DrBfpnif/gHYlK7nLK7txd5UyrjFyw=3D?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 9WUDAu6RPua+dHIwwi/JsD9iYowWbiGYXYiGV/1BRuLPDvCVqED57BRkOx/y1GGabjRqwaFNpbrhSU0N9h6MUMJL62uA4QeWMWraQS2FKQ7wIJYbOByKipbof4MOMrVENWc2+npDjlmxQ0dstbw462RgIbknHYIYm9EMeUYafiJZfqUv9jZYf+//hGLQfWC2QFOombudb6ZrGC+3ejbJv2GKM6aoMNPkGg7c/WdcTIA4Q3rg1LLKRkY8yHnlMY0Cv7sx1ww5ig8GEzK1GoepkG7uguyyVgtg8Ixjyj7uGMC9xqF83a7qQoIG0prqpsCarmCGmmsBCiCNlaAOabr1EU9x5uCHSyDGTFmzlz7i3WbqtzVXTWn8+PtoQCXXKNg7zgnVFuPuTvYbeNfYPxEBGDWyb9ACx6zRYPbg2Jy1cVQ=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR07MB3090;
 20:slswepYpjWBc4cSoX1/rmQ3TpSvSnbMvlq0bsQ7IniuQZImkEkKThdAognd+Us+FB2VO+LC4kVX2+p25JobYtIXIJG7lg+kaoQSS4EfMwP23NIKmt+vng5YGPlC2XY5qEacJ3ZjS1U2/kM67DWI0KuZTdl0VvwdEoKpWkssYXuu8N4eKmpLxTFBAO92HUcBA4aZlEUkyhHSQs+vJ9WfljCNFCA/xamABUY9d+8tYNXt1sHx4OB539ZSjUSlpQnwB
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2019 11:00:52.3355 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e4543b-b2f7-4f3c-b7a7-08d69bd9aca2
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR07MB3090
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-26_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=870 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902260082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_030059_676206_5832266E 
X-CRM114-Status: GOOD (  11.13  )
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

This patch dropps support for I2C devices with 10 bit addressing. When I2C
device with 10 bit address is defined in DT, I3C master registration fails.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2dc628d..6c7fa4b 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1962,6 +1962,13 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	if (ret)
 		return ret;
 
+    /* The I3C Specification does not clearly say I2C devices with 10-bit
+     * address are supported. These devices can't be passed properly through
+     * DEFSLVS command.
+     */
+    if (boardinfo->base.flags & I2C_CLIENT_TEN)
+        return -ENOTSUPP;
+
 	/* LVR is encoded in reg[2]. */
 	boardinfo->lvr = reg[2];
 
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
