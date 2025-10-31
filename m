Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAE1CCF9FF
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Oct 2025 09:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1OJmhMiB6T981Rk4X/ZkJteYu8GKWl225vnupw9iCk=; b=2+TNekhBQAxFLD
	EKTt6ZUVE6oLsLgg+KjL7AqASjD7ZR8+zHzjyjeo2ghXCCv/meW/cn+tk+zfFla2SB/YvTVGJlRiw
	DaHJz2Ej/3U9TAkQDE9QAJBBJ8KnwzNs8ghyBzC9XgbqgTyqjCXtRgTuwf6zQYCK+CvwlOP+PSp4W
	wIHSCpAG1cYRqnWINXh53wM6502LdGAougWMSmreTU2uNDNvzswHfyN+AwjvAXTe7g+rA28AlCY0D
	HThTzEXkbUTG673o7lZgdN7B4WySiUwhGcU1Sshpm0BqNwU9RoLtzKTyn1POBW0kv5ACwQ0sNcswX
	UnfUIrpToxV/5v5d15Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl7R-00000005l1c-2nnN;
	Fri, 31 Oct 2025 09:08:25 +0000
Received: from mail-southcentralusazon11011005.outbound.protection.outlook.com ([40.93.194.5] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl7Q-00000005l1F-0eqh
	for linux-i3c@lists.infradead.org;
	Fri, 31 Oct 2025 09:08:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVH+Fr3EPB+g5jY8qzIocMjUbO6jaU0T0iW84GoIt2T1D+xkJBTW/taviJm/0cn4224qpas/NrHho8cXHOQUZoodobTVX435nBrVTusCntVWAC6CLjdgs1Ct38EIeYOlwCsp66qQPiIfTHXRAPgFcX2/lbENlgePZtipP9vmQP1KQdSHXvYh9rUbLUGLiGnzAiZCzvVK2+bCem1/WAlZiDaOGcopfjKvQAuo+39sqmSYwdPbaf5cgGrKBmyoIWFKoeUa+wtuNwwhWo6B9bCUxEwCV0a/VBDtt9K35cITqxsHwAvAyFun2RL8hgFtAAO+MwgPvaGNym1aq6Ox+SOOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzKcYfXEHV+HrwnN8dj3/cA4YSzTWnsVhIsi7pZQTCY=;
 b=Sm6fBJ13daJm6kC2k9FIupQVp8DDAp7uStP5KJrr/eJcq0lebibplkf3F5mi6k3s465XmL6FnDLmM/o3xRaJ3z3/8UMJWlUq3Re+gYx5sS/dnXENCKC+oRw12LKlEW93TaZjhySWALNVAgn21GVsXr+2RYJ6RBw2S3D6MOD8led/LX6rJKdkDL4HaujrF4qtpCfl4ga43zV71c1ggf0z7qHugcB2zVU9mB8xXKZC/alKrBjveMQxbpMNis/LZykMoaHQwT2uOhPCoSWtTwNkgAQuwWmlz7SzZOvmA0iPe0jcNc89le8YzcQLfvkxuOt8HXqXtRe2odwMbXhQn9fQLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzKcYfXEHV+HrwnN8dj3/cA4YSzTWnsVhIsi7pZQTCY=;
 b=Wvu0RMkSOWSrRH+2+0wM2uQqC/4hggG8TdHspBEjVmTIwpnXX51xxk3T6pgoMAjBzc4Fy0USPp4D43CiKFiKDbJSMyDvmmLgK2/xZOTc61+QMMvfGc0KxHCyxtjLhKx1wpBNn9D48w6sGRZ120OdKQRXHSjZbJFpbS//9SzmxebCvLjyosL+xNaqfY771oYEzKs9CXuwIsAnOiz3qtVMJTUpO062hRomOGz6Ieetc/BhbVtCAHKBUvrv2wHFLeMuYAn0+lX1vxqi/YVlU1o0IUidfCWmCfJAwyDtpJlLOJH7Zf1v2iCIvivVLbmsqaClODhmbXTS7CnWR0lTwAAGCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6235.namprd03.prod.outlook.com (2603:10b6:510:ed::16)
 by CH2PR03MB5269.namprd03.prod.outlook.com (2603:10b6:610:90::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:08:19 +0000
Received: from PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::24d3:54df:52d0:1030]) by PH0PR03MB6235.namprd03.prod.outlook.com
 ([fe80::24d3:54df:52d0:1030%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:08:19 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	wsa+renesas@sang-engineering.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v3 1/3] dt-bindings: i3c: snps: Add Altera Agilex5 SoC compatible
Date: Fri, 31 Oct 2025 17:05:56 +0800
Message-ID: <c55c62f31b63a9aa821501bbf93c6b5e9fb2487b.1761901158.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1761901158.git.adrianhoyin.ng@altera.com>
References: <cover.1761901158.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::11) To PH0PR03MB6235.namprd03.prod.outlook.com
 (2603:10b6:510:ed::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6235:EE_|CH2PR03MB5269:EE_
X-MS-Office365-Filtering-Correlation-Id: aa040aa5-c660-41b9-a63f-08de185d08f6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aDee/S44b6jXJ15saReI+7M9osGx3NEd43wWFkWofmpKbwAR+8wyb4F695OV?=
 =?us-ascii?Q?qOuoMFckJEtJbEwnFKn0bFVeWoLqMM7vD3hOM7LRct7D6ZeOpjUDD+G3KFip?=
 =?us-ascii?Q?rdJIT5Zt/HwGm+qKreXyrDwXLby2iyu8MApcCFZdmGlBmgr14Ee2Foy61Iaj?=
 =?us-ascii?Q?A3Dl+YavGXAAJyjk4xQTjK+SgLclTduRw6mHCndvPY/+WfcOed6JSmqgcGPT?=
 =?us-ascii?Q?Ulhg81L/OuhEy59yHWY5sS5c/JQkLHHte2+R+TqPp0NhRIu10yPsWfc/qg2d?=
 =?us-ascii?Q?AJsFJhF+ckS0BwVQlA3akUr385Xub3qdLBBO14fQW+R5uh5EFzBQTQ2frcna?=
 =?us-ascii?Q?81w+zF3cEIzjaMGmL9Nm9P571dX7B3jz0JdgmmIjniRVLnBLYrEk4qjV9SNU?=
 =?us-ascii?Q?nQRW4KbdTIS5vgCnf1LCGfNAFbr+VfIJeCKOEMD6LjrGL6A3QVMCziAEAZsa?=
 =?us-ascii?Q?eF3wHHzG+K+ojIKSKEeqniJ0jj8NzpU8cpd4rvgIzy8pqblHGEBFjASe7rMt?=
 =?us-ascii?Q?7FhuHIszVAxuI8qmp7EiVYv2KDxnFuxD1rG+06y1/ULEUATTjvmza8rp3WCX?=
 =?us-ascii?Q?E/C8rezCOyNDn7At837Hc73tW2Ay/ea3X1+604Vx/AZoxXyrJV+60dMyaJyV?=
 =?us-ascii?Q?NnMyod1NZB7g9cagroaFK6XPnYKseTeZsQg3r5aQhilMBSUV4U1AYgQukY47?=
 =?us-ascii?Q?dLEdQuj3yw5qmnxUG7Hw/QlBdfs9imzouc+COqAYKxBmNDFHMV+fcDrkzDzA?=
 =?us-ascii?Q?o5uapplN92ydaPOQySZXKI7RBLsJsZf7OHRRSzs5q6oru998ETaB0ZGkEh0v?=
 =?us-ascii?Q?OlxV48GK5SUsi3uLjmWw74qhSXe0UneiXTd7x1LEgart82rferuiAraQG/8+?=
 =?us-ascii?Q?wP/d5ICOARurbaENgrL4oYmMTeZ+y7tyACTCm9RYZ3+qPyoP1L7DgW9nTggd?=
 =?us-ascii?Q?DZi6rgynTUSvMvyBx3zRronuHAIXvtleP3tmnuNI/+8Kv7OI8kvFJ64p/luN?=
 =?us-ascii?Q?z4O9+DITAQEk22XGC6H/tWilQAc5L2xA9R1yAgJ8ew4RVEO17EMBqZyI3as7?=
 =?us-ascii?Q?F/zmM1sYXU+eH2/+QSCzo9J5vTlTkoBSzYak1yeTZaKPJWPmN834wm29QzOE?=
 =?us-ascii?Q?Qg5XHcYZJb/3YXZDyAEMeus78E6YRQehA/StfHjvPpq95eTr5BXIjI1GQrIW?=
 =?us-ascii?Q?oziViqMZ+dPVFu73IHMptNHhnfmdjN2GL0XjbvAL8B34KM7enD8vsfjTgsvY?=
 =?us-ascii?Q?6/KPrRkHH43/NsEUltq3fV7FwnzbTUlp4cs+XY66EUkKyDAOg7qvZbICKDG9?=
 =?us-ascii?Q?2BaRYSsLvlxtIv+UUNL4A7jzsQ9hxYk1k+yK4SVwSRGY0dzAWag6Cd2lM+l4?=
 =?us-ascii?Q?VO7QoAljXFqFaiFwY+1EA416ZAZeW0B4VqpsSdwdcgoka89RPO5pzMZ1lTjJ?=
 =?us-ascii?Q?7JPnVdZcEvanymRq8pGGX1w6OW2cxdFoflyM5KJsnN5xixfDflLMS34n0nhZ?=
 =?us-ascii?Q?9j9lLWuHKWRsI8w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6235.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6OLZqN0GIg1dNEMlTanAHQlvtRCfpuA7FWQ49V2VXF0WvF/WmrIs1P3q+nnS?=
 =?us-ascii?Q?pYk8s4j1gyloPp9TGwTh6Rki8TndhqRNDwGMl1X6RRIS1KDymKoMICIrKlF0?=
 =?us-ascii?Q?yz8shrHDrMf5o8awlJ9hqPVl6AJv+HJgnCCJW7LbWeQR6Jw0X0Fcjy0ErXbl?=
 =?us-ascii?Q?Wpo2GmmmpYfuRhxD1x0Yg2RoGV1j9GKuWwTdtTojTeKv/JMI5QtdNxDyJNeB?=
 =?us-ascii?Q?zM5cqQOYzNm8eN6ISFz1cXt6+AcYIHVnUixA0u/Ys7oroacsSgCidYFI7Vyk?=
 =?us-ascii?Q?OYDe/kT5o760TA94kTc5yrsu1uGBT/dm5fL+NPhxgh16ADh3LAdpkZu8Ckeu?=
 =?us-ascii?Q?cw7cfGtTDWVoXbeT2JAdin5JHVAPosN8lH2FWhq7D+gC9fBoTG7+iFTjQjv9?=
 =?us-ascii?Q?I/vmk7AecstyFN/onz9GrRrDd1YSQiCdBTW8I8CysG/gMvHNVwgqjAsVsD3j?=
 =?us-ascii?Q?Y6mizxuk9FpouWANsK/UBbEKTAP//uuGoUyjZF1oW9jUO9s5jrdDWLCTQMo5?=
 =?us-ascii?Q?1O4YCCY/mvX5jVmBLFUZmd2RUGk91a0A93p1wc8bOo3wpPFyYM2eMyabmtvI?=
 =?us-ascii?Q?tUqkiNdY4HdcWGetmYy+tp1YcolvOkGgtGEz51kz48iEw6K7AmA2FJOpLwJx?=
 =?us-ascii?Q?q1Tfg5fhuhFwbn3NhI/RI+s72wofqwCHBLlkRbPhl0vhpE1In4bGrwXe4Szz?=
 =?us-ascii?Q?+30YQwwW0pYT51EVIblIlTF2xbtH/U/eq0ekfCtuMv52njhNU65kQlZWf3IV?=
 =?us-ascii?Q?g3Nm/vnrrFu2wTI7umhxA8uTxOd64D8Udz/ISzkxxTSukLyRAR2InPGEnmFs?=
 =?us-ascii?Q?epsVUbDaeTCBndkjDevsZ75QoyS5cV2QYWCYhR8TEv+dQFkL9B05+r71BOd7?=
 =?us-ascii?Q?vqkfedGPWidO0auNGTBLe11eOUuoajF1jBh/tFBnG3Sstuo739+4b6m3uzuK?=
 =?us-ascii?Q?S5EjTW6pFs8yrKmE46XaW9k0/2erTke7wVc/KXfyppqf5AXD1/8nD5E+dqBf?=
 =?us-ascii?Q?WDLILmeILXiIXKIIrYOkjpTJ5juJi0vv6vdX2N4m3x4K6KF0R4VKUi79pwcf?=
 =?us-ascii?Q?ufKCeI7DpyGgCRd4sGc6du+KUUsohJFjYmWqrJiaVZelPJx4f+m4H/AQKl/5?=
 =?us-ascii?Q?ahCPbFDJv0NZdi1ASICqo+pekwIIxrrDE73c8+4bH0KlhNDVvQ0KmkdaO3eM?=
 =?us-ascii?Q?8RAwB3h28ctGphf0zbuxNjTRDkIxnX+BGAzngleWh2H8/uEhWD0INVeBwfHT?=
 =?us-ascii?Q?/A71iaHliNJM6TINNoQ3Pp+T21QDMEHQ/6ky/DKBROC8/Vm1kukIKS8WuUJK?=
 =?us-ascii?Q?7B4wZOMIt8CNu5mwjAMhrKM6UUTI4tTOXsKd9DJY39Iz2v6RfI3fpRsft8jH?=
 =?us-ascii?Q?tefBzYuplwprvuZ5Vfe2lqwZlQzH1gb7m6WGQCbFsq83knXiDponCE12dF3Q?=
 =?us-ascii?Q?KTAcSwZ2lMOUF4CcZLc+yre97J2Y9sOOTuKcXvBAwhZcmat1K/KbzhP/vJfO?=
 =?us-ascii?Q?x2AkaEkHrUVMdK6r8Jn4obv24rsjZKRsZ5kC6eGgwX3/X4ya6ukcG9FYV0ly?=
 =?us-ascii?Q?jpgy5gEx9pzifHX52vGNACebu6hNcP52yE4+c4dCJOpBiA6MdSk+fiGPBGlv?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa040aa5-c660-41b9-a63f-08de185d08f6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6235.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:08:19.8158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5dAwY+D0yy4V75nYRVdlQsVreVy+6b85OHL4D6nJxxuQJEi/l12zt2XTobmibm7OIUAUOJ6cqkJJuDwO5EOTJuB5Cenc9E1UrJi8AVdlhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5269
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_020824_216961_7D321447 
X-CRM114-Status: UNSURE (   7.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add the "altr,agilex5-dw-i3c-master" compatible string to the
Synopsys DesignWare I3C master binding. This allow Agilex5 to
use the generic DW I3C master controller while applying any
required platform-specific quirks.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml         | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index 5f6467375811..e803457d3f55 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: snps,dw-i3c-master-1.00a
+    oneOf:
+      - const: snps,dw-i3c-master-1.00a
+      - items:
+          - const: altr,agilex5-dw-i3c-master
+          - const: snps,dw-i3c-master-1.00a
 
   reg:
     maxItems: 1
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
