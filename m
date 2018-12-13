Return-Path: <SRS0=JcjT=OW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E7BC65BAE
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:19:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0CCC20851
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:19:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d2Lk02zg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="cJK3AyQk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="IYMVfYqH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0CCC20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDYljpq5CY1boVCTQnLePvR2e5M8ekkWsjeFYTNNX0M=; b=d2Lk02zgBPBkX7
	udV7KiIqcY415pUN2g5Y3+KEi+pE3ZN5QTaVUpBxmEDr6yzhG5CK35nTCTlw9vEiFKJpU6bk4WIJF
	5qu9EABx/Y+b8glUX3C3mNTo6hSKv6Ck+wVAwKuzhvUdo6kpwPTqEhRq+JweDc3gkrwAzxQDH5MxD
	g8rgLCp09YIS27oK9g0q4A/2SQ5rgQAZ57+y34LVFDrQqEWcoTg4Lz+mBvCOxDHSF1ppTlBaLAjH+
	3a5w+QvjMmgutX+dU0IhqjnKuQYJFtFv9iRozkLmXz71CpWLZbnPaPlahxRwoYXAnKWMAOaVyrlsy
	22b/cifcVuqjDBhwRKJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXPxZ-0003F8-Dq; Thu, 13 Dec 2018 12:19:21 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXPxR-0003DM-T8
 for linux-i3c@lists.infradead.org; Thu, 13 Dec 2018 12:19:19 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wBDC7Rqa008400; Thu, 13 Dec 2018 04:19:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=/I4Y7lueZznEtB6BEFjyGenufLRsqC1HRVec8MuWyiY=;
 b=cJK3AyQk9Ejz8FcBaA4Ix1KY4SeaWWYsCi/LmI8qJtIAjQ48G8UrhfjaWoQ/OM/oAmo4
 blY9rlG08GCUOmUHRhMWjP2CRE7cCGC9p7rPKyuropxWWC78+UwMKiEj5pAxPbA3u5PP
 PLIsPLncDUvjBubqAXvTLt5uOdeYcTwtRPMWhItGSJGNpzyfZDzH8uOc62iHd/7qLi5s
 G1RmnRXr3xpLJxNAgSPkZMuuNn+8HLz1451npwI0tMJiq0kHTJwOktVMgvPLCBuGOnUZ
 rxGCjiXwOheEQRKTifxTRQkhNVfEZX+uXVj8v1jO0FFek7I+K/auo8LuDzTKVW69GDdH mg== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2052.outbound.protection.outlook.com [104.47.49.52])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2pbf1ujbnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 13 Dec 2018 04:19:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I4Y7lueZznEtB6BEFjyGenufLRsqC1HRVec8MuWyiY=;
 b=IYMVfYqH6toaF949MZDnVj2Ewoc5jZ7tz+INzVB2rorkgIDIvBbW/4IjSWGq2U1yYqjLhvtW7Wf9oHx95SWeYNY9VvRPq4YTBKZDvS5RuVKg35mpmyrQsxEpmSLo3fSkOfp2l/FCF9/nHXVIigot5jOUetCzVPPv5lGPonPQp8M=
Received: from DM5PR07CA0087.namprd07.prod.outlook.com (52.132.138.16) by
 DM3PR07MB2171.namprd07.prod.outlook.com (10.164.4.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Thu, 13 Dec 2018 12:19:02 +0000
Received: from CO1NAM05FT008.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::202) by DM5PR07CA0087.outlook.office365.com
 (2603:10b6:4:ae::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1425.19 via Frontend
 Transport; Thu, 13 Dec 2018 12:19:02 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 CO1NAM05FT008.mail.protection.outlook.com (10.152.96.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1446.5 via Frontend Transport; Thu, 13 Dec 2018 12:19:01 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 wBDCIxuk026009
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 13 Dec 2018 04:19:00 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 13 Dec 2018 13:19:00 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 13 Dec 2018 13:19:00 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id wBDCIv6X011907;
 Thu, 13 Dec 2018 12:18:57 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id wBDCIvR0011906;
 Thu, 13 Dec 2018 12:18:57 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>, <linux-i3c@lists.infradead.org>
Subject: [PATCH 2/2] i3c: master: cdns: Add support for HDR-DDR mode
Date: Thu, 13 Dec 2018 12:18:32 +0000
Message-ID: <adcd3c336c8285483b1741b145cad945bc813ce9.1544702829.git.pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <cover.1544702829.git.pgaj@cadence.com>
References: <cover.1544702829.git.pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(376002)(136003)(396003)(346002)(39860400002)(2980300002)(189003)(36092001)(199004)(54906003)(110136005)(4326008)(14444005)(316002)(42186006)(16586007)(106466001)(105596002)(2906002)(47776003)(107886003)(48376002)(50466002)(426003)(118296001)(446003)(336012)(5660300001)(11346002)(476003)(36756003)(7636002)(26005)(246002)(26826003)(76176011)(2616005)(6666004)(356004)(50226002)(305945005)(86362001)(51416003)(8676002)(478600001)(126002)(186003)(486006)(8936002)(87636003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM3PR07MB2171; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CO1NAM05FT008;
 1:e5wklat4aYmYhUXbLCLEn8SlKDStTrz3yI8r+qsBS80Mwi2CBUTIW04XQBp3824YBJrudZzDu63g2Zyy+izMY+Ke9PKBXFd9OUuo3y/KZbxFlXKDxJBrtvBSe6XtJbr/
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c3d8593-f6a6-4867-579a-08d660f52aac
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060);
 SRVR:DM3PR07MB2171; 
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2171;
 3:WWH5DE0vZQMcJvrHHZZDmINv/qnfuLVmSTJhHKChTlvCvghGknMVLqjIxbSyuKjutHNCnGVGo/fDcyNnSXrxFXu299LQX4RDK9dHF2eVmVpwGjFpEzElSKc3w9CYNijGHQF7nyiBHpSTyxQHgIA7YyeEaNPCXJXkNESIOhg6dGxTkuFhxtWZa2hWRImC589EsQQxKzGVTT10V8azBTb5SWIMKcL19aeVPn7jKMufaEVYmw4mrkQb0hWz5NJRjNuicqzfuIs4zp0I4nAoFQrhujq/WEbDSpBwhhU8lcWUs4Zm+6JuEcjcSCF+ECxrbf91mkU1BESuEi1nJqJUhaDwS2nuDL2/TFdw/MaVSUNumEw=;
 25:7EmF5tI7h7peX8PrVTlVSpwCFgneG79LrP/9g8D2GRoBlWrXwXycq/Lh9k1KZhzpUbxj1xpaYMtOz1x0HDeuDV8IRteHvYQ63dK/VXfWYrJb0wUOxaWJciBmzkO0r4rcJMkphEWaD+jj5imI5QwxQOJQni0W+0c8OkHtSD22A+sU+hYpPzabCCmaYrd5h46hrzDDWoIsg3b0CRFJnP4R63Lq2DuPE6IzpDRnOZAcGeO3VYvLitFUUoPHoomhjsTKkDQQttEBeKtQmEq40ZvXRx+bedCuTZzt6kmiX+wSYtklq5wdDXFC6ghmi9LE30kNMSgUzS9kQfJjmgwmqlmeKA==
X-MS-TrafficTypeDiagnostic: DM3PR07MB2171:
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2171;
 31:5CBgvueE3ag6sCiUUPGWdfgdmjfNtwE93Xca9lcqjU4kWpob7wWctjjYaer/azzEmxd6iglnSm4Z8GfERVDcYhWnLJoup43vpuAEVGvCINofQH8yXw9IXMXISgyEouDVkZBrPuAba/IqYGCexKkMvAZsE+OfW5iAvXDt6avcB4qjEOx4T/yZAsTmMNLE58/nD8WCL7IE0O8u/3iqM5F5nj15AnD21Ya7d46gP90DUIs=;
 20:2bn4yY+YtaXcra8nEB/BQt+311+DotHEC6G7zdeNQGufc7LBhiJ1bjHbtjBAF7XO3Z3Ln6BlMW9VA/mzAiiZe6CmKrfg5JzgcVuF9ZDhliiUPWLwdPSENZIgpJBWzlyjhsixbW+1EVnJfPRiCeU56zB/gzGRd4E1sqogVxB1TSCCNwjX72T9b7UvEU9ORzZGP9B8D/36vqGT4ZcnK4ScuSbOjQl9k96anSgMYoYebv2Y/Zlz2pBYsfmKxK0RlyIEMZE5BGHnFoMwQonDPTWFddepLvncdr3Is3Yw5c/69XNVIMyRV5n2jjgSaImc+HsqvbrTAnc6dtWIBhCKNuRnRza7hqbg8ZJ+p+rmb9QuOmh2t/RlkHw9YDRA5GzOzILoj/OBBRiqcmapm5JUOudoY1T0DQ3S3jFtmkvvOmqBaGcL1tY7+mPxPx4NjUoPVHUQ2YFLPSX6zy1TUgNnJ5xu4HJ4lK9Xc87jug5e2823oe4YWnMROXPAT1sMlrwkhgdT
X-Microsoft-Antispam-PRVS: <DM3PR07MB2171C870CD405C26897EF778C2A00@DM3PR07MB2171.namprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(93006095)(93003095)(3231475)(944501520)(52105112)(10201501046)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
 SRVR:DM3PR07MB2171; BCL:0; PCL:0; RULEID:; SRVR:DM3PR07MB2171; 
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2171;
 4:uO/Gk7tsAD/ArxgxDrJJa9BnUX9+XctqT7gvS6JzhyB5kbchQaPl/DWWDlLDa2ZClVs61uU387CzaTsiebdiGXl0akab6PDDo/oOytEUI/KVaZVkTtNFr1XXa3F8nAFc9szlM35TJGnIsCybtefN1iBUWoNqyA80tZdcZGSzf9z3732+rss8r1lsjPuo3eMBKPasn9mTzpbGnGxRrbUKUEOlgA7JIam2LM05Q+pEFZkhJlUAEveit3musjEY8R43CK5IdwgdkT08wUDYORw5IA==
X-Forefront-PRVS: 088552DE73
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM3PR07MB2171;
 23:d2M6f0/tdu3Hewt98g2jBaMlxblN0893Ge1GzdXxL?=
 =?us-ascii?Q?LTb0/XpQEF39bopW3s5PfSj4wzKAqgMv8NqwuEs3rmkabhrIcz7lWYOV9glG?=
 =?us-ascii?Q?YVuK31iGJZ2BR133xSaAsi4XjY13oShXxpU5yFtd1P+80HPsmNOjI87xyzrl?=
 =?us-ascii?Q?N7wh3qidoL83uVr/270Kc7faBRkFH+5uIm9vxT4EwfPGM2J0O3Z4yCPyMFov?=
 =?us-ascii?Q?Q6OiPQyxLmAdR05mRJDa8geieJu1cWUzPZXW+dv1ZeOUHSRKPXT4/fgvnbrV?=
 =?us-ascii?Q?Qsc7A8ma1ilRtarktKFwl52hFA65im57gfSpiVJQ0ZNC4l2ANUJhGQeh02Am?=
 =?us-ascii?Q?cyh2zHzhCEiylc0h/Kh+HapXOEw9wxxx12QkC2KhptcWn1Um/37fKEm0msKN?=
 =?us-ascii?Q?9VRR+WqlhDYXAywG3lgYWkpN2h5ugaHsILLrJ3emx+XlK1rJlhLmsWZWPFW/?=
 =?us-ascii?Q?aDnYRaZTqsncX99AoX/uCIrGPaQulxwi1sZ8ou2sXT/mkK4Bpn6BG1LhZ36U?=
 =?us-ascii?Q?TcOVCCLEyI8odPwy6m4FTwd5mk2DCslvmcPr6bslVhyYvcOTlkv1qb8BNyU5?=
 =?us-ascii?Q?SM9N1X0puTy3vntJw0WaKZ4shzkrtrwDl0olkOEaqcEEQuXs4vMqOsAmfpu9?=
 =?us-ascii?Q?9WEoiMEfZoZ0cbtnAA4Av6N3/zbyeHd957bL9aiHofT9i/qNPGISCbtxhHEs?=
 =?us-ascii?Q?mBzaJoQQSqiGYJr9XwIN206ANHpUj16fW8ZHXHLTtrrvixcZ9WAVkHXuH5vP?=
 =?us-ascii?Q?WX5QXFN+/t5zaZQpkDGdO/9rrYWVzlRrytTBcArH8iDfJpPdVP7CUkEaWX8X?=
 =?us-ascii?Q?RVyMgFcSilPS52xx/dyTngAzC4HibzJ6L6SOEbTy6EiRZqSDiavJ5mN/tcfF?=
 =?us-ascii?Q?5SDu+lHd+VIheBHPJqmmAtKpHcQv8n28ExqjBGsinFxj2lmR6dGlFlKlrru8?=
 =?us-ascii?Q?9vSpgPk/S/Tf86y0H2kt6qtJr2GhS8x7OTypk1uYVX9z1QVaQ2QS03+rc5AW?=
 =?us-ascii?Q?QtEYufzchQfsZYQuJx2os8pwRnf1dKDWgoP9XBXz330iihndr2161wAMSh8/?=
 =?us-ascii?Q?28IU8BwLfZKf21Y6rWsOkK/0Gw6F4FHUC97IdjGgNpHIoXSx7K5U2eD5PZTA?=
 =?us-ascii?Q?nto93LiiJU=3D?=
X-Microsoft-Antispam-Message-Info: sbJZwHrLJ8/nJDdLFFvV24zGcctAxZhyPQpBscYQGDoRuIk4mxcSx2Gx2FXznd/JjB7OQYqUfCv0HUvjvs8mi1qjJ9KtBCfH85sLrZ3g77uTBaXwnCK1QFhUKB/yjCwiZ9vo60mV8WaGEMnqX/ZZeBPJlILhQCngJ58cRcMYQkzY+PhpF1BCkjY9vyBqB90NKd+6ewDJ+VgDQgyf6ukM8BTGLf5xlWg1oMIIQ3QwPoh4//0X66iOmO5CqGN6hq78KjaHGBjlaeW/teB+XR8xwOHWnvc+gXSUVIy7r9mXUXgfAhQ3eBDNXVtCcK9SBpIs
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2171;
 6:BuOk9pm4yPvQnqnFqd34bgYCw2ed5ljcI+k/nOIk8ZbTTvqdApbshsHADjMHnrp/afM/tDzBNbbShXVWcuvpU8NnkmgmtfREBAzNCIglOidYMoe6kN0kmwS8O6bPe94nSaO/tLKw5jfy5mgiJsePmdF/oKNS1idaLjlKytJy6zUommnD8F1jRuNsoJRRUTZ/oSwRU/1EXjyWX//lgK5LcQ69wnxmI7A1RIFAcqFmtzU4iorT32qXonmPojWOFzs4QxL/tqFgdjQX2VH/qXttHE9dCdtwgiXtCWgocJDomvZnf9KLLmDUvQZ7aRivIIv4WCu3YIqLqG2dpyrKmSLNg+HrsWos+NwoOjO7+Sjx4wZwwIruTpE3HARTFTi24YLcMGVKdqBlXBRcP9KRSTcMbI1pYzgcl1/IWdOUZjrwm6ihxkJqFzRAEQCymt4vKzsefMv8lf2Cb0w1KTisNbnPNg==;
 5:hkI4GuKn/jRP0g+kmGWOdHoVDg88AE0UBQqScRQaqstmjphJvRQEzOwpihPVUHRbY/vUO40ddWF/K2Ofs8oscXLJKlfg5t+fC2/kuRIg2qAgQiacR0qLpJBgv+o2DRM+yFvVFQmUqefgjRWuMH3XUWWUntbpFMilidCFWVVItgY=;
 7:AeKdWljpIg6dxzNCJsAgJcmNZO8YmYd7vPUKEXWyyi8zeDPxUT/3Ak5kAk3VhmHNZ0Y10HekYl/32On0zxLcB/yOh0T0vTeEaEuAVVmjMWWkiwbc+qgzULaRr+0TKsbLAkjsl0XReVIXqqzwMp2p0Q==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2171;
 20:suHfNgbS6LkwsOflOEHLuDm1vy90w8kALkune72UEGilXaI5hpCVt+mT5w2bs6KLLCq4NBnxFHUUot5ddn3wP+thsoTpU/Siqkgzu1RnIHmZ4kviNRja8qTV9e/sKUc++DOZUmBJI4W4N1Ymjs7iCsV3WpCtJZe3WDAABRKVl0Zs5F4VGLeHr0SeTnpyj/HdJ4mrfsLmq8jq5lF6Av4qIZsE0s3lVfqug3LZhPQoRuhKGnPaujpildssHmOVyWGH
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2018 12:19:01.7289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3d8593-f6a6-4867-579a-08d660f52aac
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR07MB2171
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-13_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=29 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812130110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_041914_130520_C34A52C6 
X-CRM114-Status: GOOD (  11.80  )
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

Cadence I3C master controller HDR-DDR mode support.

This feature was originally created by Boris Brezillon
<boris.brezillon@bootlin.com>. I made some changes/fixes.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 195 ++++++++++++++++++++++++++++++++++-
 1 file changed, 193 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index a33f3a6..b1a97be 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -571,7 +571,7 @@ static void cdns_i3c_master_end_xfer_locked(struct cdns_i3c_master *master,
 	     !(status0 & MST_STATUS0_CMDR_EMP);
 	     status0 = readl(master->regs + MST_STATUS0)) {
 		struct cdns_i3c_cmd *cmd;
-		u32 cmdr, rx_len, id;
+		u32 cmdr, rx_len, id, xfer_bytes;
 
 		cmdr = readl(master->regs + CMDR);
 		id = CMDR_CMDID(cmdr);
@@ -581,7 +581,11 @@ static void cdns_i3c_master_end_xfer_locked(struct cdns_i3c_master *master,
 			continue;
 
 		cmd = &xfer->cmds[CMDR_CMDID(cmdr)];
-		rx_len = min_t(u32, CMDR_XFER_BYTES(cmdr), cmd->rx_len);
+		xfer_bytes = CMDR_XFER_BYTES(cmdr);
+		if(cmd->cmd0 & CMD0_FIFO_IS_DDR)
+			xfer_bytes = xfer_bytes * 4;
+		rx_len = min_t(u32, xfer_bytes, cmd->rx_len);
+
 		cdns_i3c_master_rd_from_rx_fifo(master, cmd->rx_buf, rx_len);
 		cmd->error = CMDR_ERROR(cmdr);
 	}
@@ -893,6 +897,192 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 	return ret;
 }
 
+#define I3C_DDR_FIRST_DATA_WORD_PREAMBLE	0x2
+#define I3C_DDR_DATA_WORD_PREAMBLE		0x3
+
+#define I3C_DDR_PREAMBLE(p)			((p) << 18)
+
+static u32 prepare_ddr_word(u16 payload)
+{
+	u32 ret;
+	u16 pb;
+
+	ret = (u32)payload << 2;
+
+	/* Calculate parity. */
+	pb = (payload >> 15) ^ (payload >> 13) ^ (payload >> 11) ^
+	     (payload >> 9) ^ (payload >> 7) ^ (payload >> 5) ^
+	     (payload >> 3) ^ (payload >> 1);
+	ret |= (pb & 1) << 1;
+	pb = (payload >> 14) ^ (payload >> 12) ^ (payload >> 10) ^
+	     (payload >> 8) ^ (payload >> 6) ^ (payload >> 4) ^
+	     (payload >> 2) ^ payload ^ 1;
+	ret |= (pb & 1);
+
+	return ret;
+}
+
+static u32 prepare_ddr_data_word(u16 data, bool first)
+{
+	return prepare_ddr_word(data) |
+	       I3C_DDR_PREAMBLE(first ?
+			        I3C_DDR_FIRST_DATA_WORD_PREAMBLE :
+				I3C_DDR_DATA_WORD_PREAMBLE);
+}
+
+#define I3C_DDR_READ_CMD	BIT(15)
+
+static u32 prepare_ddr_cmd_word(u16 cmd)
+{
+	return prepare_ddr_word(cmd) | I3C_DDR_PREAMBLE(1);
+}
+
+static u32 prepare_ddr_crc_word(u8 crc5)
+{
+	return (((u32)crc5 & 0x1f) << 9) | (0xc << 14) |
+	       I3C_DDR_PREAMBLE(1);
+}
+
+static u32 prepare_ddr_parity_bit(u32 cmdword)
+{
+	u16 pb;
+
+	pb = (cmdword >> 14) ^ (cmdword >> 12) ^ (cmdword >> 10) ^
+	     (cmdword >> 8) ^ (cmdword >> 6) ^ (cmdword >> 4) ^
+	     (cmdword >> 2);
+
+	if (pb & 1)
+		cmdword |= BIT(0);
+
+	return cmdword;
+}
+
+static u8 update_crc5(u8 crc5, u16 word)
+{
+	u8 crc0;
+	int i;
+
+	/*
+	 * crc0 = next_data_bit ^ crc[4]
+	 *                1         2            3       4
+	 * crc[4:0] = { crc[3:2], crc[1]^crc0, crc[0], crc0 }
+	 */
+	for (i = 15; i >= 0; --i) {
+		crc0 = ((word >> i) ^ (crc5 >> 4)) & 0x1;
+		crc5 = ((crc5 << 1) & 0x1a) |
+		       (((crc5 >> 1) ^ crc0) << 2) |
+		       crc0;
+	}
+
+	return crc5 & 0x1f;
+}
+
+static int cdns_i3c_master_send_hdr_cmd(struct i3c_dev_desc *dev,
+					const struct i3c_hdr_cmd *cmds,
+					int ncmds)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	int ret, i, ntxwords = 1, nrxwords = 0;
+	struct cdns_i3c_xfer *xfer;
+	struct cdns_i3c_cmd *ccmd;
+	u16 cmdword, datain;
+	u32 checkword, word;
+	u32 *buf = NULL;
+	u8 crc5;
+
+	if (ncmds < 1)
+		return 0;
+
+	if (ncmds > 1 || cmds[0].ndatawords > CMD0_FIFO_PL_LEN_MAX)
+		return -ENOTSUPP;
+
+	if (cmds[0].mode != I3C_HDR_DDR)
+		return -ENOTSUPP;
+
+	cmdword = ((u16)cmds[0].code << 8) | (dev->info.dyn_addr << 1);
+	if (cmdword & I3C_DDR_READ_CMD)
+		nrxwords += cmds[0].ndatawords + 1;
+	else
+		ntxwords += cmds[0].ndatawords + 1;
+
+	if (ntxwords > master->caps.txfifodepth ||
+	    nrxwords > master->caps.rxfifodepth)
+		return -ENOTSUPP;
+
+	buf = kzalloc((nrxwords + ntxwords) * sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	xfer = cdns_i3c_master_alloc_xfer(master, 2);
+	if (!xfer) {
+		ret = -ENOMEM;
+		goto out_free_buf;
+	}
+
+	ccmd = &xfer->cmds[0];
+	ccmd->cmd1 = CMD1_FIFO_CCC(I3C_CCC_ENTHDR(0));
+	ccmd->cmd0 = CMD0_FIFO_IS_CCC;
+
+	ccmd = &xfer->cmds[1];
+
+	if (cmdword & I3C_DDR_READ_CMD)
+		cmdword = prepare_ddr_parity_bit(cmdword);
+
+	ccmd->tx_len = ntxwords * sizeof(u32);
+	ccmd->tx_buf = buf;
+	ccmd->rx_len = nrxwords * sizeof(u32);
+	ccmd->rx_buf = buf + ntxwords;
+
+	buf[0] = prepare_ddr_cmd_word(cmdword);
+	crc5 = update_crc5(0x1f, cmdword);
+	for (i = 0; i < ntxwords - 2; i++) {
+		crc5 = update_crc5(crc5, cmds[0].data.out[i]);
+		buf[i + 1] = prepare_ddr_data_word(cmds[0].data.out[i], !i);
+	}
+
+	if(!(cmdword & I3C_DDR_READ_CMD))
+		buf[ntxwords-1] = prepare_ddr_crc_word(crc5);
+
+	ccmd->cmd0 = CMD0_FIFO_IS_DDR | CMD0_FIFO_PL_LEN(ntxwords);
+
+	cdns_i3c_master_queue_xfer(master, xfer);
+	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
+		cdns_i3c_master_unqueue_xfer(master, xfer);
+
+	ret = xfer->ret;
+
+	if (!xfer->ret && nrxwords) {
+		for (i = 0; i < nrxwords - 1; i++) {
+			word = (((u32 *)ccmd->rx_buf)[i] & GENMASK(19, 0));
+			datain = (word >> 2) & GENMASK(15, 0);
+			checkword = prepare_ddr_data_word(datain, !i);
+
+			if (checkword != word) {
+				ret = -EIO;
+				break;
+			}
+
+			crc5 = update_crc5(crc5, datain);
+			cmds[0].data.in[i] = datain;
+		}
+
+		word = (((u32 *)ccmd->rx_buf)[i] & GENMASK(19, 9));
+		datain = (word >> 2) & GENMASK(15, 0);
+		checkword = prepare_ddr_crc_word(crc5);
+
+		if (checkword != word)
+			ret = -EIO;
+	}
+
+	cdns_i3c_master_free_xfer(xfer);
+
+out_free_buf:
+	kfree(buf);
+
+	return ret;
+}
+
 static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 				     const struct i2c_msg *xfers, int nxfers)
 {
@@ -1714,6 +1904,7 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
 	.supports_ccc_cmd = cdns_i3c_master_supports_ccc_cmd,
 	.send_ccc_cmd = cdns_i3c_master_send_ccc_cmd,
 	.priv_xfers = cdns_i3c_master_priv_xfers,
+	.send_hdr_cmds = cdns_i3c_master_send_hdr_cmd,
 	.i2c_xfers = cdns_i3c_master_i2c_xfers,
 	.i2c_funcs = cdns_i3c_master_i2c_funcs,
 	.enable_ibi = cdns_i3c_master_enable_ibi,
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
