Return-Path: <SRS0=oKuo=RB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A9EC10F0B
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 11:01:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F3D20842
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 11:01:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LC7jnr4y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="EnIBTXDy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="cNVSk3kT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53F3D20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EJQ6XNXgK2IiCJa+Dwv8vO+KEoso1/tvcl2LD/6l9E=; b=LC7jnr4yq6UpqY
	IISK6EiWmFYD2QtPsqc2GAxhV0lZeISjpeBR/fEtIWZ7IWQZCxZzF7OqL2nKPUsEQLUSU1BCN+Skp
	no9JtzwTJ8c8vqK8x/liXLeJJIjjfI1CivQD8YjTpG+koOUv3wscpr0Era18G0U7uoKfp7aY9kX+G
	e3CTrFzHxFjXmhXTMcA7GuFbEw9i8R8duLzRG5d6di3BKy1Ie3HyI6KF+700D9TPJZVlVT61GPUW9
	l8fWsAWrgZa4GKpfGxUR3WiSb6jFmfXFgDk89qdmlMoDxxJj+j2o6FZ1Jn2Ets2DxCh+k+xamL4Zi
	QE5Oi0aX435diPpo6PpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyaU0-0005A1-0s; Tue, 26 Feb 2019 11:01:08 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyaTv-000596-Kq
 for linux-i3c@lists.infradead.org; Tue, 26 Feb 2019 11:01:07 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1QAmo4t025195; Tue, 26 Feb 2019 03:01:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=EnIBTXDyR2f6pIwbqYebDOzINKuGoAAqzPzcLnRrUpPTrHFm0FTdE3v73/rwHn3/N22+
 fMG/Ste34SGoLq1Kw0L7TC7gChpTpRQabiJF2GyWYe9XQAonXXAGZPpnaipJwkNFAdOA
 uLvfmAETaQISXczUlYK29KYUH+Jq+NqXa+/kQIPhrlnEDMkB1hb+aJR3t1BP0Co8ObL4
 luvoKYFCSM/0rXhCfhGyWUfyTKS/47w80S8fgIcb0v1D+1nZ7WEXwlcVnKFu4I+lDhJ7
 ZjBWjk7UAbP7pRgLEIPgMX9iDTWzOHEENM3WgDWJDXookzU/JKXY0M3011uYyxBWC/RB Lw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-co1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2053.outbound.protection.outlook.com [104.47.48.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qw2yrgace-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 26 Feb 2019 03:01:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaHEDkW2GLP/WDIQ14pqnjNBlC9Mpic66zsbSV3XaGM=;
 b=cNVSk3kTB88UjMQD9jg8Ed3zZGxHTRDgBYKMNqIuJFicJgQofFEq1kT+ixRJEbAR/6i3EzexLy9pD5PPBmHoOr+9xd3255s16Xo78GWgghZXK4s+R1snmZR5WUPUOAHxMpqP2KpkwOegpsD19ZTkJE/IBPvaBbLLJxvph7Dbbl4=
Received: from BN8PR07CA0022.namprd07.prod.outlook.com (2603:10b6:408:ac::35)
 by SN1PR07MB3981.namprd07.prod.outlook.com (2603:10b6:802:27::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.15; Tue, 26 Feb
 2019 11:00:58 +0000
Received: from DM3NAM05FT031.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::206) by BN8PR07CA0022.outlook.office365.com
 (2603:10b6:408:ac::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.16 via Frontend
 Transport; Tue, 26 Feb 2019 11:00:57 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM3NAM05FT031.mail.protection.outlook.com (10.152.98.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1665.5 via Frontend Transport; Tue, 26 Feb 2019 11:00:57 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1QB0qAm002695
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 26 Feb 2019 06:00:55 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 26 Feb 2019 12:00:53 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 26 Feb 2019 12:00:53 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1QB0qh7016914;
 Tue, 26 Feb 2019 11:00:52 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1QB0qFJ016913;
 Tue, 26 Feb 2019 11:00:52 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 3/3] dt-bindings: i3c: Document dropped support for I2C 10 bit
 devices
Date: Tue, 26 Feb 2019 11:00:03 +0000
Message-ID: <20190226110003.5909-4-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190226110003.5909-1-pgaj@cadence.com>
References: <20190226110003.5909-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(376002)(136003)(2980300002)(36092001)(199004)(189003)(126002)(476003)(26826003)(2616005)(4326008)(6666004)(486006)(478600001)(47776003)(87636003)(356004)(68736007)(2906002)(8936002)(426003)(50226002)(336012)(53936002)(11346002)(446003)(316002)(4744005)(97736004)(105596002)(50466002)(305945005)(48376002)(1076003)(106466001)(2351001)(76176011)(26005)(51416003)(8676002)(54906003)(186003)(36756003)(16586007)(42186006)(69596002)(5660300002)(86362001)(6916009)(107886003)(14444005)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR07MB3981; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bc199ff-e760-4893-a549-08d69bd9af9d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:SN1PR07MB3981; 
X-MS-TrafficTypeDiagnostic: SN1PR07MB3981:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR07MB3981;
 20:pHMo6+OGaprP2aikdLAz704rWJcm4YPJEFPQN2QMi4f0tyzzrwsDWT+Om3jRu/BIjUxrrPZAz7rwxzk7IpXmN/ZO/+grRM0YYlIMlvOcZTs2bVqX4JV0qmtYz0MNgHyA9604zibW+gG7j0OMl7oHnGPdr/LJxj3cHoF6WagIORjXqQwCNg3a9FlzC0gIf03IgBWHqUIL/iaHEmfz371NhiXHNfcjWK0Ube1qp+flhT3g3UeUtBnEOV34/srA3k3xDIXo54WoP03GLXZz3m4OzrzZFN8TAg6Kuk1voz0N6KgGhazCjPEPSUASamSRxCg/+at+/HrZd5CcsaxYNWJbw+2WRtWeA7DTTp3bxWTjXWOpCLT9ivHz0Sk0aJR3RkEJftXddQRUWJ5Qj2xXnlH8EFqNyEyIOzG/jDXp8t3ZmplvOdus4x8QqV86Dv3gTeQ7Kimg15q3DK7XLrrrSPVdhpJ6qLw4XbZ+Oam6L7ubuTUhsNo9A+eiCtD1AAWdaQRH
X-Microsoft-Antispam-PRVS: <SN1PR07MB3981F3148F9879233920ABF2C27B0@SN1PR07MB3981.namprd07.prod.outlook.com>
X-Forefront-PRVS: 096029FF66
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR07MB3981;
 23:QB7MHWLX6+N2WvXqKiUtoP8EeEG5F6RHzc0Og2yjX?=
 =?us-ascii?Q?1b5mDJsWIc+DIvbBuTaS4H4lDR0NUXFUI3Rrj4G+NyrE187+cOcYGkGeKR8Y?=
 =?us-ascii?Q?Fipc527066cL8EiI2CX5lZV2/17BlulD1H2iyigFpPfNvfaH6Xgcn0QQGg1+?=
 =?us-ascii?Q?wAeYt7FHGQh+yviRdNGHSYNpO9PPr89oTE9HbCizqOSyiM/K0a7li2yuVOcN?=
 =?us-ascii?Q?VJr9HJBsr4s5LnmSSrWE5QqvVNrDaep4D/oRL4DMOlNTDADLyq5s+439vouj?=
 =?us-ascii?Q?NmwD7VtRJReSPxh86S6waf9q9vvhmDqTYWz9AJQcOR8wz14/mIzLZiLu6iwJ?=
 =?us-ascii?Q?6xSlK2gcU7YwEiVoMToLAg2o8jnmhmngQMf6jjxGIyYaahsHeD1eWkC9I14m?=
 =?us-ascii?Q?wIQpNWyWykqajx4SmxJw9+7i3vTHoIEAPwjZE3fv2kg1OQHH2wL0/abkwH9D?=
 =?us-ascii?Q?nw5/lAFu4f9p4C9fFgRrPBbYQ1VbM6SyXBRRIJm6pOvDKDCpSGY0koxz0YQE?=
 =?us-ascii?Q?jZ+F9+6B+Ok5KOUA5EE+8mqYi7FCOyGYVofRV447Eppgtx6mTAjlj8nzoDl0?=
 =?us-ascii?Q?uFX1BFhVqTW1gVpaWzGFOJTG3Pm88tm4s/mVgTKrX8mxfoKYL+Kf5eZbnQxW?=
 =?us-ascii?Q?bntPa1k/ykn5aFR8oDGQyAa4hzjreD/ua/q/RecHm1kvQT8KQluKWnwFMWaT?=
 =?us-ascii?Q?G4yCmOnSsCDKcOILCnIAPdtIA/FGrIL6eBJ4yUo703yl+oL9vTPi2SCt/4ow?=
 =?us-ascii?Q?YEuXV9eoZbPYcCkG1kmLSmxUUg7iPobM5S3bR8uIqkuKTAxcf9N6iWnbDnBV?=
 =?us-ascii?Q?Lyz/kP1jcsz8Qd6m/iBMu1sFSG58gw7LY6T0aX4XJVVB2tp8oxfMH6yIjvED?=
 =?us-ascii?Q?DoniKHcV2+4H95HXKRHzz4aC+DgJRDx+ehx52Gy0FoOxQf2bcv27LK/yyOPd?=
 =?us-ascii?Q?t3kT3tNkeiVdpQqz1vKtDD066xjNYxcwY300LY4SH57U7Fnu6y1pjMJ/vPxh?=
 =?us-ascii?Q?BmThi4EBHwjkzer7WwwdJVyKtRHRc/9fHtAiJMmn2soW6B5bURMaE7qlH3Je?=
 =?us-ascii?Q?9etz28h8VZ/Xp7CWNARkAMtcuv0+RKZvZYrovtKY9MLCEX94w1jaYy7hLZPh?=
 =?us-ascii?Q?4Ziqe1C2LltyQ8NFBjMupYmgJjcBpQCvsHrRMOFPlC2ubiHKugDvUHkoucGI?=
 =?us-ascii?Q?BVuoJEaRV2Orcy+MOnls0JUzPadrC0rVVGKkP7URtgOZ2pY0YR4/J95HSz5W?=
 =?us-ascii?Q?ICDZ0KoYRDk0juO3wE=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: cVVqZu5dhAQbw8tCZot0fFt5zsBhCaHXIO5CMgBoDVl/alVe4lR8UzAC1P2XXPVRd+oQEQLpwNVZDGnDRG1QjHM31N8oYr+eYgezn/GcxJzoDh4neXRq8GEJD/TAFBC6fGwiskPIPKxpwhxxB4ICfJXjU7Ul1X7rkfFpSPehCtYAAB0pLTIV/lTI/N55vWeL+LG5LXxHcgCTI20kIbriksTaOnFbEpQ8yNGz/kVIZyQYtCf4LIXFj/wYJyXjJ4THYHn1T1IXig0BJDiNkpycSW6kHC09HeYX5A0XjQes3bsrb1MvzPbQZyg5qbOlzq5oWvg0UGAAnCz/BbPUV3n4owl1+BXh24W4bg5swC872EFcCzuMEf6mBeCIgYySoZpiYoINGJM/YwFwZMvppm1wcpDGadbhX5mbsN0kQ29ODwo=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR07MB3981;
 20:934CE2P/VbYgZVRJQ4fp7WE2gPh5kwneBgb4WwuXsH4BhvxPWcM7eiaizlmg17IEH2mv8T/fU6D4KECMeFHuhfXgXmk3UlWnxVG75+8q92Bju8XIas4xfoeehx4O9Avt9veEbnnw2mBSUlHrtRCpdfmC8qc29D1vZ8dwAT1FPzltbxJNb7i++3Ht2L3ebgBr7M16dkOg7zpn1VHxGJNNgH+3cFOgmbiANLZpPNwa7/pyWJ/yeuPe/Tg5tqp3GuNh
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2019 11:00:57.3244 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc199ff-e760-4893-a549-08d69bd9af9d
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR07MB3981
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
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902260082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_030103_803828_AF5E3B9C 
X-CRM114-Status: GOOD (  10.19  )
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

Because this patch series dropped support for 10 bit I2C devices, I'm
documenting this.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 Documentation/devicetree/bindings/i3c/i3c.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
index ab729a0..4ffe059 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.txt
+++ b/Documentation/devicetree/bindings/i3c/i3c.txt
@@ -39,7 +39,9 @@ valid here, but several new properties have been added.
 New constraint on existing properties:
 --------------------------------------
 - reg: contains 3 cells
-  + first cell : still encoding the I2C address
+  + first cell : still encoding the I2C address. 10 bit addressing is not
+    supported. Devices with 10 bit address can't be properly passed through
+    DEFSLVS command.
 
   + second cell: shall be 0
 
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
