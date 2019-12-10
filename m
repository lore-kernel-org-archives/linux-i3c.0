Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC3AC2D0BF
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFCAA2053B
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RoiTNans";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="fTG+9gBy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="5A2hB7af"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFCAA2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvR187dQGSg+Qm3geDmjJGa3jiN4xUkSddCig1HTLp8=; b=RoiTNansUIXmCG
	WhrqbUjio0NGlgrkfCTbOVuuMi2W6s0clJbJFWY4wI7+LbaqIMCqOVwvKOx5dBwufIPGX3K6wP4co
	an4pHGz8ScwqvdWz7bW/T9i/KNxziT1d16m7RgNmIus8ChdDGryMCkV9UZHFttqezf0qVH56k8wGU
	ye4+3HuMkDaCAYnyDN8yB+d9XZ1LGNBlvOcnskYWVlPjnyOpz8otAqAc8SI9lkpZ962efWkDO00OT
	tO+Gu7JZ6b6j60Dck5zc+xR1UUQT7LPP1u/wRJCnii+xCtgpziDpf4Mxl63MD83drx8NXIYAR8Nge
	DSnLCcSX1go+T26kmDlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iecYZ-00085b-0F; Tue, 10 Dec 2019 10:15:51 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iecYW-00084T-DH
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 10:15:49 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAADLOb025730; Tue, 10 Dec 2019 02:15:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=cQIXpaR+slXK2rIB033DG207qRE9AdFv8tkvQtPUayc=;
 b=fTG+9gBycfEyvd+/iv8xT1cwzUcxhqbPad0/8gZXLmFXj74H0JMKtnOD/EITmQSStg2T
 9ufDXtN+BHbhgbbJgGMBKSCSYdW3BF/ZB1fT44MRinWkEKsHKCUaxMFMm4iToF24ZV56
 N5X+jSDub42lTDtDwmv/boQ1N3u+8qs/Yd2dcYySy2hqp6SauT0i4oFNSMsbOmPFn3vV
 +Nwnpq/OVEe/56U4Ew0wu4cLkg2GDdk2dh8RVnCHSGVlOi0AZFOIQ3z2Sv0Ybj6jEUYU
 UUNLaTbrKr598fGdV/e6mmNU0/nHAG89gg98UmmHX73qXnnxlOLdz2cYcbymXVw3VRQe FQ== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2056.outbound.protection.outlook.com [104.47.36.56])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wra709bnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 02:15:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTGcwzy9D5PMH+Xfk2XwqdFsWHxUZbSavAvSC7i6a4K7AwnXNUFZf9bVTUTnEa5DNJ7HJ/FJLQPWCtlhtsiE7kcbqmO5f21jYXU/PwcbOxmILtejYbvvlGV1g1T0B7CCR299tjJX6sttIELQubDkr4O8f2TD23s5KDIny7cufIv7Evy8bUlHFokfMzjkK/NNqgSYxT/OHconipHWsZ3ik+ByRevPBdqv3ZfpsN31mouMlzJSOOj4bRFbLz0dNTwdHiMTLSNoOR5SNKCxgmtGKclGhrWQQiTux0+pesSM7I7xl7R9eUCMctw8W++WU7dGRM7sqZoOU/OMYYb9bXzhcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQIXpaR+slXK2rIB033DG207qRE9AdFv8tkvQtPUayc=;
 b=JgObcqLA9sdbr+dD6TP4nYsm0tOqrblt2tGrmYwm2kl5015/BWQGGkAy41xmoTlCN/LAstkl1lAOqk8yjZIrWcyyj7PhqeSVNfsEbdOb5aw5kSR3V0R2th53gm05QfGb5RPFZoNvCuLeyrcQ6gzVcmDdzNpyCF66+61cYUO2lksaGvclEz3gMhYUCaSHq5/91IQyOxrg/HIz2soSFq/k6pJmg9b278P7vPlCtyDZIHyykwCsiPwp5I7s2tMvyGL1qBm5pf8ci/776tTPJg7nAnVzj5ui/FhT8mbQEAJmFIa2DPdRmEdDHILG11I12c58rsI61ysBh3qUj7P364IyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQIXpaR+slXK2rIB033DG207qRE9AdFv8tkvQtPUayc=;
 b=5A2hB7af2HbQleawuQ4NzTH4VrDKS+rthAzl5CsamJUQMIg1e02F8+9usKxi9d35kjm2u4KRxlC9uAPRsl3Tu4/Y06jSMHcMZybiJ2WwjgLFuEOPD+7BsdTQ6zihE63bIZXI4x9qhWDuOsY8j3SyhnDmq+aIXnxVP0mhZsFgPlg=
Received: from BYAPR07CA0077.namprd07.prod.outlook.com (2603:10b6:a03:12b::18)
 by BYAPR07MB5557.namprd07.prod.outlook.com (2603:10b6:a03:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15; Tue, 10 Dec
 2019 10:15:43 +0000
Received: from DM6NAM12FT057.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::206) by BYAPR07CA0077.outlook.office365.com
 (2603:10b6:a03:12b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14 via Frontend
 Transport; Tue, 10 Dec 2019 10:15:43 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM6NAM12FT057.mail.protection.outlook.com (10.13.178.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 10:15:43 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 xBAAFdQZ031071
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 10 Dec 2019 05:15:41 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 10 Dec 2019 11:15:39 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 10 Dec 2019 11:15:39 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xBAAFdWI009313;
 Tue, 10 Dec 2019 11:15:39 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xBAAFdYL009312;
 Tue, 10 Dec 2019 11:15:39 +0100
From: =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 5/6] dt-bindings: i3c: add a note for no guarantee of
 'assigned-address' use
Date: Tue, 10 Dec 2019 11:15:01 +0100
Message-ID: <20191210101502.8401-6-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20191210101502.8401-1-pgaj@cadence.com>
References: <20191210101502.8401-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(36092001)(189003)(199004)(426003)(336012)(70586007)(8676002)(8936002)(81156014)(81166006)(70206006)(478600001)(107886003)(186003)(4326008)(26826003)(2616005)(5660300002)(1076003)(26005)(356004)(42186006)(54906003)(86362001)(36756003)(6666004)(6916009)(2906002)(316002)(76130400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB5557; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abe0afba-bd2b-4812-d669-08d77d59ea31
X-MS-TrafficTypeDiagnostic: BYAPR07MB5557:
X-Microsoft-Antispam-PRVS: <BYAPR07MB55578C42C702CB89DDEBB51CC25B0@BYAPR07MB5557.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 02475B2A01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ZNQ/iZ7GaqxlqjTLDvvHqbZ/4LsAkG3IX0ADBvtN+42y7+byQfHbFF0EP0u1tMN9hV9/zh+WqjH3UMxE0t3jakM/6BwQA8S9a1PXmnQWC6h3syMQSJf+o7do2gyn4EcoMPyssXI427kd69N/m404woWzwvM0ktkuisb51LgMBEeMLLpD4VxbN7M7vt1sY5qw9WtpEQBbi4AWqWSllkEo/YjiH39YpQ3BWhUOHhw3VbKTO31X1ErxWvlm/Y8E0Qe8FCsXBBGdsktV1Ok3ouL6e9tMP8YIAywH/uMf+jJ51LCfEmaT2eu+ccDjftHY9svLB6Xenuze69F9MvxzcRIssVxvDe4M3+xjOK70NN6sOGqT9GwDy4Hu8eqZDdPKWz3U1iI8peifqsDNtbKmkdgwEi49CYm1r/IfYSQCI37uqrvu0Z75i38QfiubgDGQUfWdub0TL+/D+FiMW/OTG0x5ZmVjW/06eEnyU17HKRnF81nmOHliJe88IsoAHe1d2MQ
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 10:15:43.0280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abe0afba-bd2b-4812-d669-08d77d59ea31
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5557
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 suspectscore=1 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_021548_447980_77CFAEA7 
X-CRM114-Status: GOOD (  12.65  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
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

From: Vitor Soares <vitor.soares@synopsys.com>

By default, the framework will try to assign the 'assigned-address' to the
device but if the address is already in use the device dynamic address
will be different.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
Change in v3:
  - Add Rob rb-tag
---
 Documentation/devicetree/bindings/i3c/i3c.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
index 7fee9b4dfba0..e7ac9756c731 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.txt
+++ b/Documentation/devicetree/bindings/i3c/i3c.txt
@@ -100,7 +100,9 @@ Required properties
 
 Optional properties
 -------------------
-- assigned-address: dynamic address to be assigned to this device.
+- assigned-address: dynamic address to be assigned to this device. The framework
+		    will try to assign this dynamic address but if something
+		    fails the device dynamic address will be different.
 
 
 Example:
-- 
2.14.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
