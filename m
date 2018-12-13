Return-Path: <SRS0=JcjT=OW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97F2C67872
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:19:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B778920851
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N1PmKkRK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="ildKSwvw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="RaCM34mi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B778920851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHYZ+1/wVPFMYeW8sYGBVzcQwjCFDldfGyUgv4HaqWE=; b=N1PmKkRKfFfjSn
	69r2mxCitouZgTkMJ+V2qzIBjTKCB4pX+njLQWTeKA1RAViDlYMacQ9aowzRjBUy1rybRH4XcpQmu
	3Xt8Vf5bYiTA37QJEzsAUH9DhINkYVKnD6z3nOKjDcaUqEUZIjyKxnMffnCZ2Z6Mcz8E5Zrwt80Qu
	4P0qq9VFHNBA9r1T3gdjsSIETSMq3XOo6ZcNCTBVzzKlGoKkTdK9sSJwpTTVrRkLdnQftwA/+WUt1
	kUXNGd7Xt77MURR5aqA6XC3Inz4Q5WAPZFMuSgPY9yOJ2THlxL7XXpdL1gBakctslHpmDjYly54mz
	6WGBD4av3RA3geIvSS+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXPxV-0003Ee-B9; Thu, 13 Dec 2018 12:19:17 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXPxR-0003DK-T6
 for linux-i3c@lists.infradead.org; Thu, 13 Dec 2018 12:19:15 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wBDC7Y2s008445; Thu, 13 Dec 2018 04:19:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=YZGj9K3zbMl5AEcdDINUpagKmy8fEB7RXJzIBMJlOKI=;
 b=ildKSwvwQwrHWd1WlPyooayVegIjhZWogwZvkvaBHt0vHZYs2Wb9jY2Js/u5+auNSx88
 bSNymisTlCw5cL4+AvdxN9unV6remKAJS5V7J+62uXg1yQS0kcqEZEDbEgiKWJBBuI4d
 8/077YZz4BUwRdk3w79aQ5fBQBR5fTW6tzgNFO59pFUDPqfaZnq4y7xb3MLsrXyFbrZq
 ixsgZ2qQoINzmeQlgE21IKqNgNaiC2EKbvaHvv3YzBa1UgWncoApRqqwLuB4lV6k36rk
 EZzU884UM90YryZUPdBEvQW5uDmrH30My+ZlJc5zgrzzfstywrvzfcd0JKYoO/f2x2cZ Gw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam01-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam01lp2058.outbound.protection.outlook.com [104.47.33.58])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2pbf1ujbnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 13 Dec 2018 04:19:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZGj9K3zbMl5AEcdDINUpagKmy8fEB7RXJzIBMJlOKI=;
 b=RaCM34miCg49Cc7Fqjm3o1arjOc9gZ75byLzFRlvjyXs5OprXVgVQivMCHkdG8pWmAxkGs8r6+66jUannKViMllS6jUxwbLDFgGGdjbazrc5YpYJ1nwkipALP28Xl4VH9sdVHBB4CU2lu2V1j0Xt5N+HfHDPJEk8p9XF8vx0NU4=
Received: from DM5PR07CA0089.namprd07.prod.outlook.com (2603:10b6:4:ae::18) by
 MWHPR0701MB3722.namprd07.prod.outlook.com (2603:10b6:301:7e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1425.20; Thu, 13 Dec
 2018 12:18:58 +0000
Received: from DM3NAM05FT021.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::204) by DM5PR07CA0089.outlook.office365.com
 (2603:10b6:4:ae::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1425.19 via Frontend
 Transport; Thu, 13 Dec 2018 12:18:58 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM3NAM05FT021.mail.protection.outlook.com (10.152.98.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1446.5 via Frontend Transport; Thu, 13 Dec 2018 12:18:57 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 wBDCIskA017230
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 13 Dec 2018 04:18:56 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 13 Dec 2018 13:18:58 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 13 Dec 2018 13:18:57 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id wBDCItN1011804;
 Thu, 13 Dec 2018 12:18:55 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id wBDCItac011803;
 Thu, 13 Dec 2018 12:18:55 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>, <linux-i3c@lists.infradead.org>
Subject: [PATCH 1/2] i3c: Add support for HDR modes.
Date: Thu, 13 Dec 2018 12:18:31 +0000
Message-ID: <efb3b8692d3579ab3369cc0f80e237550f3e8209.1544702829.git.pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <cover.1544702829.git.pgaj@cadence.com>
References: <cover.1544702829.git.pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(979002)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(36092001)(199004)(189003)(87636003)(305945005)(118296001)(316002)(36756003)(54906003)(42186006)(110136005)(8936002)(16586007)(107886003)(47776003)(5024004)(8676002)(14444005)(478600001)(126002)(486006)(2906002)(246002)(26826003)(106466001)(7636002)(476003)(2616005)(5660300001)(86362001)(11346002)(446003)(6666004)(48376002)(26005)(356004)(336012)(50466002)(105596002)(50226002)(186003)(4326008)(51416003)(551934003)(76176011)(426003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0701MB3722; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; DM3NAM05FT021;
 1:L00nvk150iI6+QnKjHqKvbIe5mNga94bDAXB5QAKc5Y0ALhHLbBCvdk8Hx1frqrK4h66ADfdNjBYf2YetF4YrIVEqMCAviLmLb5MyxNTgY/YTNkg7FAVsYRzC9+9lwCt
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3b10e53-cabc-4d04-a42d-08d660f52874
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060);
 SRVR:MWHPR0701MB3722; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3722;
 3:rKJ1mWPOUfNadcPOCvHJJ03xIAh2KhqR/Aai8L3fPfWr+N5ugXNJx/CXBg8kcT6OWPV6W+dBgCNCraT/7mkV6+ZeFxDf0MBOeXDk8iE8FXKCl3ZrLe+ysEP9MePfrqeIZXzDuaLI39aza/wnyfuqraL65eJUhay6yhLy/6yGvugxz2elDoa8f7WtvVkVupff7DBHdshhTycHvqisk5dTmK+hTThncoZ8auLvoWl2Xc56mZzK8MsFpRRXJ5F8GEYap071WueRxnF1m3qJi39kE+v/Z/NUMIaA8YstfHacCS47CpuQrSrkgrkp9p2CUfJMYRCqMdQNt5J92xlxGA4+XltIF9rHvrrXt075oke0Qps=;
 25:i5yYToVU1XdKuJu2AHC81VhtWUgY0jpruE+hhMl7EKsAgFQFwcteqT+GaRwCevbhz1KS0gweS7EEJvSWJZWj/34eFkVevMnOf18iInm7qmcleK+RHm7uEn1aX0D4vpdFLEZJnttt9UrCHgqt9dkwn73SQ97R48cEPR0ke/6ygTctT7GFCCjmaTFg+MDPpoCRrEtlYgKQihEnHw0thMP2+j5YR7o3QuWIFfZB835kVAa+C5x8ID5mStwlKlySffD16gcPZwMZrI/C0oBgpWiMaM8YG5Wh8Y+zTttTjnscWz9+ji+nFtLvERC7q9xUosrjz79PkNDNP/lZkiwWWzn5EA==
X-MS-TrafficTypeDiagnostic: MWHPR0701MB3722:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3722;
 31:d8kXWtK6Wsk66RbyukkRajlYBGpfm1X7Ft9YLGWSh87iyzEBqGen0G0yjoBLVaUA11nyhB7cG8bEvtvAt0d/vVWZDbN2W3Qm7hpkKdbpOsqgFjT3cBqCNWoE09VkI+vvqt1UZ/PZucYpOP3gWRBJsca/XpRMdaYt9e7C3JewaKTuQYMTQmJOli/mOlsFShGwjI4WEc/Oxx/e7JGNm7OtEkg4sOVNhaoS7Sia8ujKuao=;
 20:WschtCk36irMk6cDld5CD3C2nLyC5VhecszhdjSQWldMm4cRVgZ7nu8VSAo2+EtT/JgcDv1vR9SvIZgnn6Gx6vLW5jm7SyJboDqayxQh3A55JoXho8/koDc1gs4hmxeb90YBPmEfEYbvScru6HOc8eKQbmbkxtZAjmVPFpTG3oVKQQgSXXy9tQBhL2JeQ4AiasxK+/TLyZIkpvWq0VAdwLNelimFw7ZLNM8CnVN3IbFWK3Amw31ZKQAg6Fnq8TfMkmZYS4VXalgbA3osygo7InmyYTGpqqjKON2kDOBUL58zFnAHpfPYt9p6JdMzGi2D1pfqqrdjCT3xQYTmxgU8jtROl+SlYpwYUqdzeOd3gE8ucnFp8AdHemHyMuWa7hTV0NsHMmfXkLwW52nBLdV43Mx0S5RyK46PKC8Ew+DDHo8h3rdEME8KYHDd9xeGelFfqrVWB3e0RqoAlKVpUDky1ko6/27k3YS86Wj539grfOxaYh8dKfZmGXpXVkoe7jad
X-Microsoft-Antispam-PRVS: <MWHPR0701MB37229D3129BF5DDB9A7C3450C2A00@MWHPR0701MB3722.namprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3231475)(944501520)(52105112)(93006095)(93003095)(3002001)(10201501046)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR0701MB3722; BCL:0; PCL:0; RULEID:; SRVR:MWHPR0701MB3722; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3722;
 4:Nnwi17yzpRPPd7FFAeucJopDQ/K0vWH9X6mlsRsx6MEp694JEhq5rFwx0ORczkoyHMTX2WTSEuTJC5JB9O6LgzePWUssAP0g4NCspt6hAOZykcOh54FmB1f6s2aO4ixpguTP/vzd1HcribhFIDsOHZ4btWpmRPMwIalRrs7xJTGv/WiXF1gCdMq4Y0bVysIno+G+gJYysojuIWv5QA+KJuh5fIdprML7RCiACHvDHxa47kTr4LrpxpnYc6Y9Op3kGxmHTGGPeCP59bvHYv3PDw==
X-Forefront-PRVS: 088552DE73
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0701MB3722;
 23:Qc2ACdfmK2JJObHiD1Y3thOzdOT5E1lPQNr+QDf?=
 =?us-ascii?Q?LxNrtlDD1S5WT9kG5D0uRNZ/y+dbBzgHi38pp9GspE96s3OFISJhbteRv9Dd?=
 =?us-ascii?Q?OJcvgMh3L9HOSgw1P/ZxSJEq9kVfTm+xOjR5RlMQ5QwQiZga3ZgNFRcvb4tm?=
 =?us-ascii?Q?9QRPBfnGd5CFUpYT8TRlhqwIAFHHXvaIfvMLTtc9TIqwnMeYogTuMZeNZWv/?=
 =?us-ascii?Q?P/oanK5YYQAhuvXDqPdOBx/TKbtBgLugLacygWH3l284MKhUrZyM/UmVpRmF?=
 =?us-ascii?Q?ApelUymQOPkkmLRxprTT1m0oXx+Rd5QuJtkj2MpEYRfBvwdLVsBwsta80bei?=
 =?us-ascii?Q?e6dzjrBFqwb8QLKFeWAR6jYTSfxHEGR9cdnY9dzVaWZeZ4X7SUJXRL7QW4wa?=
 =?us-ascii?Q?SIPdPdAk9rDX9/xFaYKzMnfL4CwDDzSQL1/uR2hXgIwnZSD4E54q/WofuMMv?=
 =?us-ascii?Q?Ausd5H79y+iXzhHNABKGT9prHy53IsQfc0YWwbvY8jlec5ZB8GbwiKf2/Ama?=
 =?us-ascii?Q?Lr+yn400FtDecf7+Koop7/ns11eTuKlOxgA9Kv+efxpYy22xoQOZyMbKN6Wq?=
 =?us-ascii?Q?uYYXopKwMKeUIoNKPibbSFg3spZoLTnoyzXfDjkj2P0I5opOCLD5QKGkTe/8?=
 =?us-ascii?Q?hXij3wuKa0cucnwnR5RUs2LKk44NMlQ5ZsOah8XRabaOotxvVCBRDV2drn0o?=
 =?us-ascii?Q?sk8Z2QHQwUulDk5W7gc75lKZYgVapTOed8VCbvHUxpMDrgRcZx5fC/n155QP?=
 =?us-ascii?Q?3tqTl2hcAcaqwgKAptKZdTAW2VB//pxDzlHCUUM0xE9HCr3UNfMzr7AMkyZX?=
 =?us-ascii?Q?IejQJ07DjBW3TZ3eorMnvxl0ifhf3mGPPeB26Sk560rg6kCYGfD57TD6enNK?=
 =?us-ascii?Q?j7alqjIn+Lruhn6N4NWQM/aNefXRnVwkS77vDvv7Axmvs25OhSRQbGe5EAMD?=
 =?us-ascii?Q?vkPrRu7ffHVfHFO+5739FIZDji4nUK2qrTx/RIXbow9LTWyb3LBM7oPpQeFA?=
 =?us-ascii?Q?p32SXWk62WMvEHdf46nevBJ6jgvTmt7kw+fAWfEPi2xvZ4qSxlCA7ZPyY4nA?=
 =?us-ascii?Q?QQVJ3hxt3fNw3ICUMxdDEzcKdeQaplYuxxbgJdszWCXsV84qwMeN4LbkEVK9?=
 =?us-ascii?Q?w7iAIGmzrXUbqcZxW9aJ4pjzPXV4x+pQgGh0dE8Fg4jkKTjZIHWgeBqVJMeo?=
 =?us-ascii?Q?D9WfeQWRBcjwpKKqIxb3EzoJPqfurCmOH0bNw4B4a/oantmtmdB4BiFXOlro?=
 =?us-ascii?Q?c5TvB8E7A7E17G5YhENk=3D?=
X-Microsoft-Antispam-Message-Info: 7pd6wxudoq9trIUuePn0l2lnDtqn8OaZEMMFsbFx0W5grTOvIRuI0iaX43IdjZ63vpxOC5VyeCjKVme0JqjE2zSSWCL6xbjieI2bgz+sqWOKIILs9y2HzBf+QAQWpvuzpjBQQurmpaFxqgSDqbFYGNoRGd4lK3H3+9lgU2Ge8kHjJe+FVJaZuAzBby18uUC74QbagTFqeGQPz3l22bnzlDzhmVpYZ10RC2o8v/3uqZnPKqIoUz/fCmSRxv4eEVMURhmDl1aMZXgEoQDq7Gs6ASoYRv9MSSNDHU48JvCDRMyVc/9isHZ/CmXAgH0fviOF
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3722;
 6:33bmDmFwiy3bqrdmgph6GfRPuL9URbIYWt9qFz8hK3wnqBKLtdbWlYfvSQoHAoVS/x7TJZx2v8kP8qpkq6+ju9pfoOu0AHvvukTDvl+HFZUwUo6DX48KL8pzpvkdizpNXk73B5J6yKNscbopy+rAdwYPIlObU9S2PP9+J9zkg+L56tW8FWSjqul9NZ2RSDKKqJU64Zd7BiI3wJEW6rxojOm9i7Kjav5TVnb7NXehweTeqo69ViRCCUfZYPwCr1cDmjHXcXAE1d2wXABM/v+R+HIdCAfC4cAqRqgXzjaH/ICfZehuu3aitk7kYmiVwPyqJ3BhF7ALzFMi+ex5lywTXDs/4P8TURrZBIy7/9apS+SMUJc5CCQXbcXMQ8sfaG6unkV3ga2SYV0XuYGbuq30eCfO5rBQ9Grj9NccoryaevFWL+TRmksGZ8VKEPJHpkxCjnmfhyKJkc73amN12gFKRw==;
 5:Z5ZgLFKpxEl6UyakeSY3oQNCI0vShf6uR0R4uq/E3hM2CZ4GyBmcGSumuwW4HDCLz0OZmGJQnuN0cMnH6BQM9YPknL7W1fNl30beOn5XWNUgFOndnclkMAg291U9cT+igWCvjje3LZHc+ReLm9IMpneebJBYNFSAo3fHKHIvt3w=;
 7:6NAbRlkGpqES7l3iMpImsr/zvNdRjxA0GZN5hQgkFhP9+IXFaKWCIcUA1Kjqx9WTRrYkRoL2pBS8qxXKgAsx6lisFlXtYtMgnFglkcONMGtmynfUVCc5VV8ZzlLN8Y+t4TM/dhWAh25JO4FCO3uNFg==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3722;
 20:oOsN6oFlT+MKXwaHke1dXSzxK+6nuCYBa4Gk16Fhhb9HzCGmDXwgdKXfR2k1n3slVhw8aPQHVb5w1NKBN/ZnXTRHkOaRKxEwdiFtB/hUVZK8BfZBdkhl1dkZSOqAJbVhZgYNLFKfSh7KjYAPk1xXOW6UzUFsxIORP3j4JA5fA52TZ35MOXFD4LWVpvaLQF0mqmQebEFR19CYOh0P2vU8QnlSeFR1aNa0gJ3GWz6Pg4vjvqkWeJ3U7KllghHgj3vi
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2018 12:18:57.9303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b10e53-cabc-4d04-a42d-08d660f52874
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0701MB3722
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-13_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812130110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_041914_124697_CE36FC50 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: Przemyslaw Gaj <pgaj@cadence.com>, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

HDR (High Data Rate) modes is an important feature of the I3C protocol
as it allows to get higher throughput than with the SDR (Single Data
Rate) mode.

Add new controller hooks and extend the I3C device API to expose this
new feature.

This feature was originally created by Boris Brezillon
<boris.brezillon@bootlin.com>.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/device.c       | 37 +++++++++++++++++++++++++++++++++++++
 drivers/i3c/internals.h    |  3 +++
 drivers/i3c/master.c       | 31 +++++++++++++++++++++++++++++++
 include/linux/i3c/device.h | 29 +++++++++++++++++++++++++++++
 include/linux/i3c/master.h |  7 +++++++
 5 files changed, 107 insertions(+)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 69cc040..97910aa 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -51,6 +51,43 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
 EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
 
 /**
+ * i3c_device_send_hdr_cmds() - send HDR commands to a specific device
+ *
+ * @dev: device to which these commands should be sent
+ * @xfers: array of commands
+ * @nxfers: number of commands
+ *
+ * Send one or several HDR commands to @dev.
+ *
+ * This function can sleep and thus cannot be called in atomic context.
+ *
+ * Return: 0 in case of success, a negative error core otherwise.
+ */
+int i3c_device_send_hdr_cmds(struct i3c_device *dev,
+			     struct i3c_hdr_cmd *cmds,
+			     int ncmds)
+{
+	int ret, i;
+	enum i3c_hdr_mode mode;
+
+	if (ncmds < 1)
+		return 0;
+
+	mode = cmds[0].mode;
+	for (i = 1; i < ncmds; i++) {
+		if (mode != cmds[i].mode)
+			return -EINVAL;
+	}
+
+	i3c_bus_normaluse_lock(dev->bus);
+	ret = i3c_dev_send_hdr_cmds_locked(dev->desc, cmds, ncmds);
+	i3c_bus_normaluse_unlock(dev->bus);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_device_send_hdr_cmds);
+
+/**
  * i3c_device_get_info() - get I3C device information
  *
  * @dev: device we want information on
diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 86b7b44..46c4de7 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -18,6 +18,9 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 				 struct i3c_priv_xfer *xfers,
 				 int nxfers);
+int i3c_dev_send_hdr_cmds_locked(struct i3c_dev_desc *dev,
+				 struct i3c_hdr_cmd *cmds,
+				 int ncmds);
 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
 int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
 int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index e98b600..16d6dd5 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2791,6 +2791,37 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 	return master->ops->priv_xfers(dev, xfers, nxfers);
 }
 
+int i3c_dev_send_hdr_cmds_locked(struct i3c_dev_desc *dev,
+				 struct i3c_hdr_cmd *cmds,
+				 int ncmds)
+{
+	struct i3c_master_controller *master;
+	int i;
+
+	if (!dev)
+		return -ENOENT;
+
+	master = i3c_dev_get_master(dev);
+	if (!master || !cmds)
+		return -EINVAL;
+
+	if (master->op_mode == I3C_SLAVE_MODE) {
+		if (i3c_master_request_mastership(master))
+			return -EIO;
+	}
+
+	if (!master->ops->send_hdr_cmds)
+		return -ENOTSUPP;
+
+	for (i = 0; i < ncmds; i++) {
+		if (!(master->this->info.hdr_cap & BIT(cmds->mode)))
+			return -ENOTSUPP;
+	}
+
+	return master->ops->send_hdr_cmds(dev, cmds, ncmds);
+}
+
+
 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *master;
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 5ecb055..75a947f 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -49,6 +49,31 @@ enum i3c_hdr_mode {
 	I3C_HDR_TSL,
 };
 
+#define I3C_HDR_GEN_WRITE_CMD(id)    	(id)
+#define I3C_HDR_VENDOR_WRITE_CMD(id) 	(0x20 + (id))
+#define I3C_HDR_IS_READ_CMD        	BIT(7)
+#define I3C_HDR_GEN_READ_CMD(id)    	(0x80 + (id))
+#define I3C_HDR_VENDOR_READ_CMD(id)    	(0xa0 + (id))
+
+/**
+ * struct i3c_hdr_cmd - I3C HDR command
+ * @mode: HDR mode selected for this command
+ * @code: command opcode. Bit 7 encodes the direction of the data transfer, if
+ *      set this is a read, otherwise this is a write
+ * @ndatawords: number of data words (a word is 16bits wide) to transfer
+ * @data: input/output buffer
+ */
+struct i3c_hdr_cmd {
+    enum i3c_hdr_mode mode;
+    u8 code;
+    int ndatawords;
+    union {
+        u16 *in;
+        const u16 *out;
+    } data;
+};
+
+
 /**
  * struct i3c_priv_xfer - I3C SDR private transfer
  * @rnw: encodes the transfer direction. true for a read, false for a write
@@ -289,6 +314,10 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
 			     struct i3c_priv_xfer *xfers,
 			     int nxfers);
 
+int i3c_device_send_hdr_cmds(struct i3c_device *dev,
+			     struct i3c_hdr_cmd *cmds,
+			     int ncmds);
+
 void i3c_device_get_info(struct i3c_device *dev, struct i3c_device_info *info);
 
 struct i3c_ibi_payload {
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index ada956a..fd50473 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -386,6 +386,10 @@ struct i3c_bus {
  *		  This method is mandatory.
  * @priv_xfers: do one or several private I3C SDR transfers
  *		This method is mandatory.
+ * @send_hdr_cmds: send one or several HDR commands. If there is more than one
+ *		   command, they should ideally be sent in the same HDR
+ *		   transaction.
+ *		   This method is optional.
  * @attach_i2c_dev: called every time an I2C device is attached to the bus.
  *		    This is a good place to attach master controller specific
  *		    data to I2C devices.
@@ -457,6 +461,9 @@ struct i3c_master_controller_ops {
 	int (*priv_xfers)(struct i3c_dev_desc *dev,
 			  struct i3c_priv_xfer *xfers,
 			  int nxfers);
+	int (*send_hdr_cmds)(struct i3c_dev_desc *dev,
+			     const struct i3c_hdr_cmd *cmds,
+			     int ncmds);
 	int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
 	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
 	int (*i2c_xfers)(struct i2c_dev_desc *dev,
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
