Return-Path: <SRS0=JcjT=OW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37103C65BAE
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:29:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0639D20645
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:29:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eGShwLbj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="O95fJbtT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="mNqtsRD8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0639D20645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y9tdNRNzH343NeaWH9WPFFckv2yGrJJPsO9PqoM4+k0=; b=eGShwLbjqXsVGE
	1KInI+QcZagPUCeS+iAdHpXhAtngZ0iZNezjgjdTmtcQncxE6Kz+h0oc3IalMn258tmYx78DOF0C+
	rCnKgKNuG5EPJIUh/CGUihkDz5u1xnqujKbYIoQwB1/N2zYLnmFD+zvPFE5Dx7lN/7AcYbkKdL/hu
	1OK8ut+bSFRBnYpqYLXEjsqjbgaVtopL2Jg1skcbu58B/k89aXjV0681c143YOV1eSnGr4Yrecz/k
	JGoM/A4GeFQ7lKKZPfjkhgVc6oUz1oHwFq7nEOM5bwVkqFRpgWvS1xpNV7LdDFv0Rxls9LE24hrSq
	yYq8o7Ij+Rhip/PJ3GAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXQ7K-0006pO-Cl; Thu, 13 Dec 2018 12:29:26 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXQ7G-0006oD-ND
 for linux-i3c@lists.infradead.org; Thu, 13 Dec 2018 12:29:24 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wBDCQkdu028087; Thu, 13 Dec 2018 04:29:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=PPFC4Bgv7UNLXtR3SrFoHBZZ36aaqx1EjFkkfPZSzV8=;
 b=O95fJbtTnUElAC98bsKPMYyR1TAtDpLZasnnGBaoYyhpuiRt9taWxRmTe3CSr3edj9X7
 eMWA/o+n+ISMIa1QbFUh4PSCa18ciTJA1Tb+MIkIldURIo0t+vOsjqA2B1cg+g4k7DwU
 oG+cnWmFlf/h8D1Bc0IffZ2hI86ySjgSb2kL4HwoFN94gVBAa72ca4jgfYdXMuv+x07s
 xSUaw7BfBtAX2eoJEsexH4kXSy0HQq4hMnE92o8D7TQ+NJUV0z5gPy3Nfw8F1JdupZjB
 s5v2VnxxVobt8wZZz+5cGQX9ajuv5Kvqf/Z4EMPxfqxeKL+IINitn19JozkCAlv+dWk6 UQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam01-by2-obe.outbound.protection.outlook.com
 (mail-by2nam01lp2051.outbound.protection.outlook.com [104.47.34.51])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2pbf1ujd21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 13 Dec 2018 04:29:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPFC4Bgv7UNLXtR3SrFoHBZZ36aaqx1EjFkkfPZSzV8=;
 b=mNqtsRD8N3TlAQWRFuy1zimdstPx8B6wRSR0YeuGQwQmPD7RsC/6Ehzs/HPJIW2JuvaMflr1KyqeNNF/Iq3SGiMx/U7bfmUnOxuZoXaNI8YwDozGgYLJlbqWXty1luzzqt9Hz6eXM51og4t/lJ2Jc3GJ9npe469lFowYNW+IbTQ=
Received: from DM5PR07CA0113.namprd07.prod.outlook.com (2603:10b6:4:ae::42) by
 DM5PR0701MB3720.namprd07.prod.outlook.com (2603:10b6:4:7e::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Thu, 13 Dec 2018 12:29:07 +0000
Received: from BY2NAM05FT044.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::203) by DM5PR07CA0113.outlook.office365.com
 (2603:10b6:4:ae::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1425.19 via Frontend
 Transport; Thu, 13 Dec 2018 12:29:07 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 BY2NAM05FT044.mail.protection.outlook.com (10.152.100.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1446.5 via Frontend Transport; Thu, 13 Dec 2018 12:29:06 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 wBDCT2j4018736
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 13 Dec 2018 07:29:04 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 13 Dec 2018 13:29:03 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 13 Dec 2018 13:29:02 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id wBDCSxKp016167;
 Thu, 13 Dec 2018 12:28:59 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id wBDCSwbo016104;
 Thu, 13 Dec 2018 12:28:58 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>, <linux-i3c@lists.infradead.org>
Subject: [PATCH 0/2] Add the I3C mastership request
Date: Thu, 13 Dec 2018 12:27:59 +0000
Message-ID: <cover.1544703840.git.pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(136003)(376002)(39850400004)(396003)(2980300002)(199004)(189003)(36092001)(305945005)(336012)(68736007)(426003)(316002)(8936002)(50226002)(8676002)(51416003)(42186006)(16586007)(54906003)(110136005)(81156014)(81166006)(26005)(356004)(86362001)(186003)(486006)(48376002)(47776003)(14444005)(50466002)(126002)(2906002)(4326008)(69596002)(107886003)(476003)(2616005)(87636003)(106466001)(105596002)(5660300001)(478600001)(26826003)(97736004)(53936002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0701MB3720; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BY2NAM05FT044;
 1:wpt28CekFSjkPf7fDnB1nHlm6vmhVHjoOox8d6q7XU69HsjLXG7+bB6ZNmg9nEwTNL523PYUtTzxyd5+J0lkiqngOdFHefgkyAr2ABfwMZLTn7cZM0Qrg1xgZPGg/Rvt
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90552811-aaf3-473c-9374-08d660f6933f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060);
 SRVR:DM5PR0701MB3720; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3720;
 3:Ut2HBhvgQinegzVQKc+dV0jGygv+eNtsmaUZ/ZUJDZyu3uVctS0VrKeU3OvyxV2mo9Mv88mP/l9q8KXWdGz8CtUk0gyjlKtqIr/FJLPqkNFX794j2IGGguAyh7zqem2f9uYBSG2nOI7f5JglHAa6SGD03hexYY0qMdZ5yrDPyrvMnbtEiHCKdO8ipZvB8DhwYZmpIdO0D39t/PSfkxGA8SJhymtMFKzlYstpUVS0IOeH9AoZvgS11l039drwPYhwStmhQXrGfccXUP84Rrp44o5BdhF+nhuXir+aY90XoXfePbeBjnsmQBXZkzZcdDvpfjGsAD12p2kFY7oLOq3plA==;
 25:J29LbD3aq569BOOL2cWY/dc1B/+HbUk3/W6w5sUiFEoDOn5estCVm0KLpAlLMhMbQ2gOvObKPNfAHYt6dvsjz+IExprzNovd85bpl+wOyX+acML6eZVK6MHwyR7xF4LKsXIvMgv5wGiqUrduq1TH9M1dVKHvax9172mX7MtV8v/bgpi8+eRhQO1PI0FJeG+CA4TRYGAWFMBlkBzjgs+2yJXqxRE5HzTaQ4mmk7obCYvNe8IQoZGxp8aKqi1xJSuhI3fHzqAWNvbwUTyRe5f9u/gBtSR3CPjCm+ftwNiKxJZUoDCd9ZJjMUCXvVKvnM/qVjPZ4JmSBg/SNQpai2ajXP89EP32c/l6CcXUU5CBTXo=
X-MS-TrafficTypeDiagnostic: DM5PR0701MB3720:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3720;
 31:ba/bO8+hxBVTeFVKY4Uit6+EsMxUU2E+FfZTOvFoCiGJmcT/cfuZmYtKFQCh98Fu7I7RCcjQtmTf1cAlWdfJb/cftYSfQfR+wyMN3RpJZvlLy4XoVfBTlRP/uEihMVR5qsC2RLafnKaIn+jJZ1eAYu/LumdU5lpK1iu1eH8ibsgsWdd7vjOt9XfIwwNRjae+ouge2z4mYlJHWRzS5boCUqaKQfPNlDOGXqtmjPJTP/E=;
 20:ZZmdUi+5bQxuuFB6MUxJ2CZe6avvH+vgvH6cB5YSoLDrqYQGsZPeVxNbSrOh3/9aLFehuNXUoCYclU/l0enNanTyU1WCb3tGOQdDR8baYE7ZCK34xIxbfKA2ewKgvz8oqvJ8GL7iZ1vsqN63RdBbXrNRtFOq/FNXY0XGM0OzN3eaCQHgN5F65ZJ/agEi2zXpwvwUyj41MTv1m5ThCCdaBv2K3mzYFH6/Jn2Jb9hXEPzqSnk4/MUpSAmvxSVMafla82wTjF6tYsjghpsp96D5c5SU+Y3usYLbfzXmDAPJk1a/P9Z9v0IitE2Mb1koioY6bG79b0HMcphUYMmbakI0bqssyTTw6F/AHEICGW27w3a4tolYITGznLXCmQOPX4YHmLzdWcQ/814kDwMqHru2hMQz2qYnMZGQ09bTpykp2qQzj+9i2puAiQl90CmbK7wUWL6Y1z+1aAN0d79qOL4k6rJLwolgzG9CouiyqG2EFzEc6XzdSlcRd9/IMDf3xg+w
X-Microsoft-Antispam-PRVS: <DM5PR0701MB37201E52CFD11AC5CC1335B1C2A00@DM5PR0701MB3720.namprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231475)(944501520)(52105112)(93006095)(93003095)(3002001)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:DM5PR0701MB3720; BCL:0; PCL:0; RULEID:; SRVR:DM5PR0701MB3720; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3720;
 4:SxOaec6bhkrrncWcj/AMYH+VxdcRZi9y/lkslmptdyECV9ljmUE5L4SX71KMN65jrA2hae4LuxEqRLkrwiNcGruWNtH9+YuzuZdgqzJihHA3PZ5HrcVUaTtf5+2R7P4fdzO6J0QfyrMxPHlhY5UH3BBPzsPySR/Rj6bkAnXaVqtNPXokegk2I3A+EzbaavhwG6AQcRFzYmoY3NSR4hkeYvenWr1yww9oSpS6KtcTwjxXX0YBJOitU1bwoH0gqu6LF28iSonHgK+bPlwFQMXkdQ==
X-Forefront-PRVS: 088552DE73
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0701MB3720;
 23:441Uy8sITtqRPlUapY+CO+896mdpv2qyUzietKQ?=
 =?us-ascii?Q?sklSt5e+jTLQTyW9uNsWz6aGcV41Kg/vnJ+EchY/XCExZXCK7B72QhnQNxc4?=
 =?us-ascii?Q?NU3myHTYN+SPCMdOoVIzQGxrf8cawPRSsQ1uGhq4J61rAOxOdu9ZT3Nh33fA?=
 =?us-ascii?Q?rHQAFZS30V+m1ckoH3txM8hsgszmPkAPuev29P+hI9U/ruZFbq24PI0xxiv3?=
 =?us-ascii?Q?KlJ1/uVSveHlv6irm9N4ftHUqlEZl5++sVZwEdU8csHao5ZAO/AWsn1lYrJE?=
 =?us-ascii?Q?GsK9w2WmrFxZIL/hDj3u0r1tBIDMoCURKJkUEFGtol69ANNJ5I4kkg24wfW1?=
 =?us-ascii?Q?w7zmdhNPJX3GxhbeSpvrwRt4hIVgjZEm47TJoZinnh9adbXxWYhtLYAR0aC3?=
 =?us-ascii?Q?AmDxx3KK6WXbZrr6FfCdPfSNDYcvUfhP7KVjR07By/RpLKKxln3kfx6Zyavp?=
 =?us-ascii?Q?B7qlVfCCV2u+zf/keyWmRH1EDO3zWkHdeO+VR3DMH8nj7OSmG1Euwg0bNM+s?=
 =?us-ascii?Q?IklfdLUqXceqcTMlTezLuQRhleNTf8wFPZ0QT/SJpfDvGHTMfmwLgyE2ZcpJ?=
 =?us-ascii?Q?I2depq7N8xAcia04VsQBi1TqiRm2BIPQrWipZfNWyV4VPq6q9u/B3PKVHqS8?=
 =?us-ascii?Q?mW5Go6yKhOtVB8UVmForSmbLGswyNHHlIRZMTQrwKXQZOALpJMh1hxKjWqmt?=
 =?us-ascii?Q?TPLhyWdT4i/BSoeyOQC00HsCDVAJliQZdhFVhJfgIgM8hKanRvL5y+vRoVqF?=
 =?us-ascii?Q?Y0X/AxiFtcNiKaSfD3yStsbzk+UxYtrg1J5HE+GqZ+VHngfiv1oTI0HlrGsc?=
 =?us-ascii?Q?vtnuXTNh6mPROiCYxYYBCfBUR2d6m/MZrHqgLWxckFBqH1nMJIe6J1QCkNhE?=
 =?us-ascii?Q?xdTC1gBlOPW5mbqrs2ooj/hEb9Ut9FPojBvmC2n2REpo/nfgs8qk0LqByJRy?=
 =?us-ascii?Q?PaVsePfcASUavqOBy1/rQVhUta+0rjzrIOq9xMHIxXwV11Ql4MWmCcbZdeYg?=
 =?us-ascii?Q?Rg+S4De44rHJYqTalefaNzjTebBu1iKmQVAPo9WiX/vZ8DpqQqi3aoLOPr8V?=
 =?us-ascii?Q?1R6HM5tFGnAr8qj+yRE71UtdAGA0Yh23IW3yGi6PiQFu4spydvKnjyzX8nI5?=
 =?us-ascii?Q?Nug2PR9kVHNw=3D?=
X-Microsoft-Antispam-Message-Info: Q/9+1NRX3odImV/41czWJ0bdv9To9wamxrgdLz0iuo7QBIUDnkET+RYdEptQ4bKzj15ndpfX5H+gy4y+IKpvieXG0SOV1qwFPFTPf6yKDigqCEIQxlbQnTUvPsI6IMg7iHY1NILVBzo8K2GY1iPm/QF1retQuBxopO8F/+EbEZ6eOKbLo43uX3fOtKRvpqBWNTRTlGxIFo6O4ZTiPLX2u8jCZQWODIvvSTPCn3Q5zmKXfVWQNnEw1ym1fdasS1fI3dTmeLR8J9RkkFNVY5z3c4lBQdK4SdpZ2MBqriCa2ih6UDYKK800fJKi9LjiGugV
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3720;
 6:tNHZIiOQk5kk0lXhxkOMqrxJyV8EWMURX7Z0O36NzlC6PKDk+JCApeM6Blj8IlTHP9Ev/5ovPTpbt1rWy1moF3xe4ycDGkXGoq4zpg/Bt+t4fB67XmKO9hcIqvCtYtwrFvuGS+HxMzpAizy+DJDDyHCbwJVueMfB+z+u853RISjIm84gj7nfPwjroraSCOOhIecvNdo9ab9jxh64rHT2VPf6Pe2kq5OwXKH71q7/YjqAYEhMuxie2qhFv4cPu/rUmm9fuTZh+ShUC4RnxlrFZAHoDvzqPXf6u6Tv8nbTiGnjJTnMvZgl/vC+tarpe6+SteFq1S4Lue0HEZ38nwIRpbmBVNU65SbqCRKfI3YlCpTUR+94oDeTnuHl9wp7A5RV9tq2WM2wOiEGMRHfx1h+zZAB9WNKnToHQKtvlxuD+omP885wEIc0+r2wqbVyeL6uSu/TU45Pm5T+XlXE01aibw==;
 5:YIXgH+sHCKHZILmqPbcTilg4SyZMufchzlB5bEbFI0mBbt0c/Hlgv0EW9dNMfA7y/HQ2nI6h0EwmaK0CsHRlkQ0wk2cw1HDHQBRHhgyCtuDpRgWIzC9Q7G1IsygTdFxbXTRXMa08YgCYxkAuhtYov3XtNRCoCDNGIW3J4xfdYnw=;
 7:P30BVF3tvd2D6yYgA81nafFox5FctVXdJ1oAbWwzGzCXjjj83CKM0oOhwvIvgTpnWjIXDvgEkWlnhT4IGm8Ksw0Q9hx6XHE71zoss3Uhwybm42v4BguiC0WzOXuzsZLtbn3N0NrSSXrSkVzetp8FLw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3720;
 20:mOqULjPcNRtTvUbi/S8zJCO/oXwqtY7B19/Sm4obuaT2vWfqVlwJzFjraEwWOMQrc/QYhEOJ7olV5gcX2y+wniMA/Xh5UUrRCmTRoKBhPx27Y6Fz5LNZTs0HjnAgbaJxCu44NJzCZ81/seOZggGQwmpDT3z4T9nNXfYPNXBtZlEWQF3pRSAQyq9zUHfUvGTb7cx8Wj7KrBG/ey1u6scwdgpb3G/lVKCVBKobcLHVXWvqVm0GmBcnNIQ+J2fINemo
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2018 12:29:06.5642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90552811-aaf3-473c-9374-08d660f6933f
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0701MB3720
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
 mlxlogscore=729 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812130112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_042922_876105_63C639ED 
X-CRM114-Status: UNSURE (   6.97  )
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

This patch series adds support for mastership request to I3C
subsystem and Cadence I3C master driver. Mastership request
allows slave to become the master of the I3C bus.

Przemyslaw Gaj (2):
  i3c: Add support for mastership request to I3C subsystem
  i3c: master: cdns: add support for mastership request to Cadence I3C
    master driver.

 drivers/i3c/master.c                 | 260 ++++++++++++++++++++++++++--
 drivers/i3c/master/i3c-master-cdns.c | 316 ++++++++++++++++++++++++++++++-----
 include/linux/i3c/master.h           |  43 ++++-
 3 files changed, 560 insertions(+), 59 deletions(-)

-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
