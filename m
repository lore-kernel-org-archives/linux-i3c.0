Return-Path: <SRS0=JcjT=OW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,T_MIXED_ES,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA202C67839
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:19:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ECD520645
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OS44lZWa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="d2SLaUYg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="pQH1KEbe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ECD520645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gky5dELv+e4Ohvny8NAEv6X1l3b1pYIften83SpnDWk=; b=OS44lZWaTPpso6
	RsaL3pdcbyfxa9VtQaYzviusq47j+RqT8l7Da96nfHN12NehBM+m5IqguvCApmXbEbsxc89dVhk7Q
	fCARLJc5fH46KVdEoui21KcQz4I8TLQ3UdzytfqgaL2rNHbdJi652S+CqqUbyhQSt9ngitBpcvFmv
	+C6S0/6t9qiLOkBP2nGiRbJ9synFB1xSHvrMy6viSAeUmJ80aOcWG21x3RiS9tQ8iMnBa6lJC0eIx
	PqSXuuKj5xLEBU1o/zzYgZyGyliLRaTjFLPMHkCLlK4OBiAk/rSTz9mHHbRKR4lr3NGgUCCS6Lt4r
	K6BbG9hq1cVMdBx+NVEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXPxV-0003Ea-8T; Thu, 13 Dec 2018 12:19:17 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXPxR-0003DF-T7
 for linux-i3c@lists.infradead.org; Thu, 13 Dec 2018 12:19:15 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wBDC7hwL009020; Thu, 13 Dec 2018 04:19:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=8BuA2+3qqa8TK6rnVzKyRjw1jfiaak9Xsk3FZkE0YL4=;
 b=d2SLaUYgVnTPBXlpV/qF8CJhJ7evN2Is2l/l+njcVSqYuR3d6LW0Ha0tOUpKfjc1C66F
 fPyG1wB3n1BLgLEqEdrwr+FOe0yRYHojS9OTM6jOB15fsU6spDde38QEEpsH5gc+8t78
 uz5G6bVWrvgRq/5QqfiGr6Z8nH8ACbD+sIfLLMinHvS0ENdAVdTaJoVtHBeZCZraMjkF
 a54UTjD4RMOQ6yQLWOUYIikfIq64/iENj++g+/qwCYl3r96Sz+1sFO6xVkQ7Rct2imKK
 DhaXYNJSSbgno0WNWEAxoDR/41GGyvvfXW3EBwB2Wch0kKX7mIrRtpXvpTlATwT4dfDT GQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2050.outbound.protection.outlook.com [104.47.44.50])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2pbf1ujbng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 13 Dec 2018 04:19:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BuA2+3qqa8TK6rnVzKyRjw1jfiaak9Xsk3FZkE0YL4=;
 b=pQH1KEbergDoK8O99FUfgOtCNk3kfBpppCB1ITATGK7W7Za5d3Oi5SQCmYXJnCBrSd83fhBuPVFBTaXcOhHDrdBPIeQCnFor04NP0CgQzl87+VykPCr9XntENen/g1P6SKWQRK1KFpzDNHRB7wCPphf7RgdG2D2qT5OkRcwOMMg=
Received: from CO2PR07CA0044.namprd07.prod.outlook.com (2603:10b6:100::12) by
 BN4PR07MB2164.namprd07.prod.outlook.com (2a01:111:e400:59c6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1425.19; Thu, 13 Dec
 2018 12:18:58 +0000
Received: from CO1NAM05FT007.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::208) by CO2PR07CA0044.outlook.office365.com
 (2603:10b6:100::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1425.19 via Frontend
 Transport; Thu, 13 Dec 2018 12:18:57 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 CO1NAM05FT007.mail.protection.outlook.com (10.152.96.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1446.5 via Frontend Transport; Thu, 13 Dec 2018 12:18:57 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 wBDCIsk9017230
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 13 Dec 2018 04:18:56 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 13 Dec 2018 13:18:56 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 13 Dec 2018 13:18:55 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id wBDCIqkx011640;
 Thu, 13 Dec 2018 12:18:52 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id wBDCIpsm011576;
 Thu, 13 Dec 2018 12:18:51 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>, <linux-i3c@lists.infradead.org>
Subject: [PATCH 0/2] Add the I3C HDR modes
Date: Thu, 13 Dec 2018 12:18:30 +0000
Message-ID: <cover.1544702829.git.pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(376002)(136003)(396003)(2980300002)(36092001)(189003)(199004)(8936002)(336012)(2906002)(4326008)(2616005)(476003)(50466002)(126002)(7636002)(246002)(86362001)(305945005)(186003)(51416003)(426003)(48376002)(26005)(356004)(26826003)(478600001)(47776003)(8676002)(316002)(16586007)(110136005)(54906003)(42186006)(105596002)(50226002)(87636003)(5660300001)(6666004)(107886003)(486006)(106466001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN4PR07MB2164; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CO1NAM05FT007;
 1:x2QTUtLSf4llREXXPMsz3ww16an/fRewUXHtPeYt9sgUkfQdTaFvcOFBUvzxqG+81tewiInQwPD10m4MgIEebtNQErNsJN3UXYGaZGD0sdvfqzVl/vu6YWv2jXXacIc6
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e1a1be3-da0a-4d73-a529-08d660f527db
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060);
 SRVR:BN4PR07MB2164; 
X-Microsoft-Exchange-Diagnostics: 1; BN4PR07MB2164;
 3:L36rgFkUWfiN41X1mP/Vgiu5BIqMPr1lYV1svc7fBM2BjlmZhaRTVxwkWYxCnkRCQnAVL217kuHswDsOzeyBtIXwMxnqGdsprejenof2MiycvWl0mGaapjwmCNe5qSQh2ORePGwueFklMrWxmA39oIw7WIYtW4/z11rHDeod3Waa6bpxZ2tHPXLXOEmYr21/05ZiR+cF42i5fuXhW/jbDVDaT0me0DvZSIDA2bqERLthfEzyjCPLOvoK7d0XPBoDlcOXuNVTR+fDyxx6u+FPK/oFN4jGJxP1ACm8BM78nuFVEc3aLEDZt8yZqnN5q6pvTwUGXVZZE+P7wdbYwTChPLl6ND/YHZoXIGy+Xb8o5gk=;
 25:x1wKjP7y8apNDUFFKOm5Lxg687vVxKPn/0x8K/oa126hauBt87T0mI0z2rCzD75Opd1v3qRsdwd5Gyyc+he+AOZH8Bsz2Nt+27uoXGqAbcOTB5kto/Y/x7cZgH412Ka7fDuM00b6BU8nagjXenb/S29g827EOzB88pv9uxkigINOwJCY0jDW/1HLv8xwFMXwooMoyCD10kJcaG4gG3wsi3WwDksCZYIm+/t1Vdi92zUyOpUMUEHy2xI6SHA/s7Ud3wIGow1v2qtudpGvYbP0xExAvIJUCXMjTqnmSm53X6Se7I3MQkSnErqQlZW6rWYDg2tLq5tbja8tP6qwOvv3rnKGt+UAuQu2NSnyaN31KcE=
X-MS-TrafficTypeDiagnostic: BN4PR07MB2164:
X-Microsoft-Exchange-Diagnostics: 1; BN4PR07MB2164;
 31:fkhuBKMqIQX5QsUAWkIUkZJ5Ui/esNSQBDn0ge9IO8Q6b4KbjTkHijAiKaatEMSxXLWgcfiE+RkP1I/sH3DBgruiscaoIr99pH5uLovQA5gCRbxjZE9Mlr1quJZX28kUY654S0AOeoY7c9WQyI0bE+rmtKyHB61aWEQHRGrB9fcFt9DGi12TQMONXmR/ZIRxx2zn5vJOKLys+q69rzIWI/WJuoZetaUTVF9mGRIHdJo=;
 20:b0DQP9w3BNbK4MEG8hB/dFSJjJLJqlj5NsIONFX32SxsgcJHveUboEuq89VC4A8/lvEQhlXqXJLC27vlDLmPfB7NIXnOrGNwzzzvrCF50rYuGEmCmULbCll/cLXbl/dnb5qtAT64ac6NvEGMFDMkRMSHwmpkFQbRstBKU2qFtBhKfmoCKubqp+Fqkbk8TyOAHoURHp2xqh7oCZKIrWN5n5frSEmGHTx/AiFfltC7HizDvOXBrvRBU4xuSmlvU4RbosOX6O8eIbrEX0m+ujqo3ozt9KogPaJdUp9yT/JPUSIl8gfXGIOv3XDQcmvgLDrASIf8UoXY5Bae83umGu+VmmIdIJwe5MV6vl+NO52FBBoMIc97g2oZI2lhoWAMGPAgBxEAEBuKrjR9JoYU0YeZ5uS0rh1qEclcBCsfHV4JvuIq7UkDg3OyRHpiGOi39mPyeYOE/f/41iH7qcUF8bEu+67RB/MwfpARtqn7tx+5Q2OKm7o0aZE2iUcpDXx1ZR1A
X-Microsoft-Antispam-PRVS: <BN4PR07MB2164AF36C1891FA9796D8096C2A00@BN4PR07MB2164.namprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231475)(944501520)(52105112)(93006095)(93003095)(3002001)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:BN4PR07MB2164; BCL:0; PCL:0; RULEID:; SRVR:BN4PR07MB2164; 
X-Microsoft-Exchange-Diagnostics: 1; BN4PR07MB2164;
 4:H9tVjrNcE43g1hF0+ZBgqLeLq/VOKgFyOKWTZyfP1VJXLXly6equ+yPBEgpTL5GJbT+3bi9MR6SCdDbFCSHxFpEnzb+7mzAiYU9PBcdof5bLDFfVWdm/GhOrGDoDqL+VTSblDlO3hb8wNvw6NW6AG0bL7WQuVa6eK2QURcvCRcvCc+xvUKM8rqlVLuxNliTFcMDioPR/FrwqRTJCKzvp0OF0aYR2OUUB7cyUWk2xIu7Tp4TKYDADk2kktqdglLXEjzigavHFVrKll6WXiPq2Pg==
X-Forefront-PRVS: 088552DE73
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN4PR07MB2164;
 23:5BNBrQUvgHMnnYW1V2hXUZiaR57HsrgHZxBzMTNYl?=
 =?us-ascii?Q?DIP0320aq6ujU5XpXHnX0VsSAQWQIeKz9ITNNqCf4d2TzHnZ+PWvSx1Xk+KB?=
 =?us-ascii?Q?AGtb5BuQjInKDhkm2Yva/01gwzGFynh/A9SzgWBhl6bxbUyE75QiEHLg90aW?=
 =?us-ascii?Q?RgVuG/FQGCx8NGYH5MuPG1zuNJ+zH6+QR0Plvcpt2apqiFn3oyNQfuXnh/eu?=
 =?us-ascii?Q?MXY0tiVhgn7WoQFyJ2EtFX2e4xdfl5QNdsqlgCbip0Qk7ByqTtycdiEDDLTh?=
 =?us-ascii?Q?O6uwlMcKWWE9Pfaew4SMD5Pb5DXjjv6/SnapwYuiaS//zv8km7z2W8R5n6qd?=
 =?us-ascii?Q?gjo+WZaXbCNKba17s/qxjAhiB3j/6tTWNUKd4/F2t/MLbvuH7h8tEh0TIBBK?=
 =?us-ascii?Q?iYMmOK0kYwQKBKo3Sd68tTgqFBZiE/ZRVOYTRh2f3KHxt5QjCw1fA9aeoc0L?=
 =?us-ascii?Q?korke8Vbd1zeS15whNhtwBdIywGo1J+z6uKG2BDhXQpoIZ97Y3vyvC+iVEoq?=
 =?us-ascii?Q?cfZRXpYYl591g3TP4r2eBv9ffe+YSFenNftziI4fWZRvgYVENlgex6FKl1ZL?=
 =?us-ascii?Q?Tj1Gfv6uaEslPmfqK9pwVBNMceZon9/ztyRpsDiTyVt4EVJyFPvHVqohXQ68?=
 =?us-ascii?Q?2e/r/ze2PaQh0PolV+JcJzU/TKG9Pehi8jHs5Nlp5oP+iiiXfvFd31A1/Zom?=
 =?us-ascii?Q?O0++sVJRIwum9X76AJYcnEDJj891fqbAvEkcomNVIq4mdoX/qn7s84rvExST?=
 =?us-ascii?Q?uIEU5NBVeRvSG8XQ8Uhh5o1ttaSGJpNt0ame3KbQtyZRXgKpmW7AtuATuhZ5?=
 =?us-ascii?Q?rBI0/6Bprd1trceB9EgdKFLm2H7Apevqt7quilfC2pO3NGCb1eoF82qgAH2x?=
 =?us-ascii?Q?PSyn2dDC2Dz1nKKYUaaPeRrYM5lr85L2o1UdShtj/GGCbexoTwu5Q30HUuKI?=
 =?us-ascii?Q?wNlAByGwBE7nd9nddJQ+ch56e1XCIczAI8a4nTJZ08ec9EqHByJ4wxEJHUyn?=
 =?us-ascii?Q?NOsx8NB8XKK2VEChWs3P0BR?=
X-Microsoft-Antispam-Message-Info: yYGNK1jO7eM7+zsRK7EDVjxlSTnqnJ/R0hmw+URrXmw8vSYfG7ap2pFDfSL5ved/ZkbDvUoG/pZjsauhrxhHJcN/igxBrU14admlitpY52RZce+sVOtX+XZf8KqObc6s2NQA0eVN1otPgfVlIJsHyqZNoW/kak1qag0etW7dRtVXvjUXoNVIOy0B7++pOQzO3S/+nz97tMHJaLbnRKJxStPYE9rBHw7YCDG6IC1Hs6JTl4+G8KSKKzFz/AN6Z396sT+ImhySr/q9zsHYqnCsN/tjm9/Z3mr35pFC/YTckUboZhqlY3tTjX+gsyceDnBA
X-Microsoft-Exchange-Diagnostics: 1; BN4PR07MB2164;
 6:jiL9Xp57I5V89CFkSB8wHkl0jp64+tSgW8VyBOBp9ww0xMvPxS7H4eqFmpMnuG3QZezpmY16wAYaeQdfqiJbX382Ti9HBuOcVOeHcXXa8OpQRBWzx///GvYaYt76O2262edLAHdmYNmuHs0A7LtXqFWDUarI50m2z8z4ZQyPSBVw5ea7UTS5/s60fO4pbGDgzITgNxLceDPjjQKopsTw9IU5BelSBJD/qvyeY4mWRMIWSwJrSQI8pv+17QdW+jMg2hQCTwdDNrUawZ2B+66YjvORAVi2RZZNGfD6xJeGeVFfd/MR89Yp/pjKCym3hwrTLkTY+EZ/3ujTiThHjFZ4UA7DwDk0ZQJQvbap0NF4gGHtgeCL816FIKBR5BrsE6RUlqDbqo2uwBoN2b88EWUNqh/d8q4zUrwg5cUw63cMuzYRxEU4ATfquo6IzUkU8AcoHB9JCHzvEpei8ONSgggXuA==;
 5:0kfTowORxAUF1uIb5Zu8Gqf92Wa0l7OYYt6GmZ5TH+TUI4zNpClwbrb3bjxPlFI2D2aeHuNPERGF/t2e5NzgSK+Gng+tE50AdZMRICVOtf4nuAyR703/YUdvGFcfgil/O62zmPUj8dw+c/AL3B8ofIYiRkIFNDFONGJRsWRPsZY=;
 7:Yq9ZZhx03yyZUiYMEamZvYn5JrX8+BMsiq8JwR/UQoDQLdU4ustGdtts6PCIj++0G9JiNkAmsvbuRZrBRZyc1nZ609/7kF7xlLuY1K4noIO3A3Fd1qD/IVq7D59PTjRh5zEuvSRdtH5pFhdmmfht0Q==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN4PR07MB2164;
 20:EbBV7fqBnOxsNE8D3HLoHDpsoDMtA5frBUFF3NTrBdHlOYXoIsvcraqBenJDCmFKZfKaz8+/03MdidtrETyEzdhFU8HYecudZDQLtk+06kzdKRCwPxLVCWj8hdjdAsmVJK4IUU1GxSP6CaHYPf3p8PS4rkqLvaOU3ZtrPIVQYkfenh17N2XQ1JZ2jF4MZb12RdzS9S94f6DtZqcXnJk9NKlf4Nh/DMeTS6DFAiGL9+VtMdLNHAO7kytMX6YUXKFE
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2018 12:18:57.0057 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1a1be3-da0a-4d73-a529-08d660f527db
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN4PR07MB2164
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
 mlxlogscore=529 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812130110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_041914_128725_7DC9819A 
X-CRM114-Status: UNSURE (   7.47  )
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
Cc: Przemyslaw Gaj <pgaj@cadence.com>, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch series adds support for HDR modes to the I3C
subsystem and Cadence I3C master driver.

Przemyslaw Gaj (2):
  i3c: Add support for HDR modes.
  i3c: master: cdns: Add support for HDR-DDR mode

 drivers/i3c/device.c                 |  37 +++++++
 drivers/i3c/internals.h              |   3 +
 drivers/i3c/master.c                 |  31 ++++++
 drivers/i3c/master/i3c-master-cdns.c | 195 ++++++++++++++++++++++++++++++++++-
 include/linux/i3c/device.h           |  29 ++++++
 include/linux/i3c/master.h           |   7 ++
 6 files changed, 300 insertions(+), 2 deletions(-)

-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
