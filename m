Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1808DC48BC3
	for <linux-i3c@archiver.kernel.org>; Sat, 17 Feb 2024 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=81Yd+0jgAOrrSpxltu92m9sqx05jD0cUNV25Au89Sos=; b=eQ9Ah+WjxeRwZl
	TcYpuVLax0QOQSLhS3tNPh77dheF8/czd0lGOKYLLmWKywbFFlSnpCFQJVO3jHy0+eIXhgJ0tvQs0
	WQCMLr8FVjtpie+E+lbVi2k3GBiBRsbY60Qo5GRWfsBy9unDGB3YOevGTaprViuxCyQ8yfmnGR5RV
	14rI6FaJrH/FjloJ7NT/DGn6Ew4Ou5X2e1NZI+yNxc7jU8Hj4tdMdFt0LIz890+am0wyAaE/h4fp4
	ZysSvLrFoOXSsrPrF1kfoxmht4Ui0gCZzgcjRaRnalVn6rJ+9/FPzSBmrLWG2ydyuRJlDzjeR3owL
	3tMg+F5fI4jSYKPp8JNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKkq-00000005kQy-2MUT;
	Sat, 17 Feb 2024 13:29:20 +0000
Received: from mail-tycjpn01on20601.outbound.protection.outlook.com ([2a01:111:f403:2019::601] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKkm-00000005kQY-3jpY
	for linux-i3c@lists.infradead.org;
	Sat, 17 Feb 2024 13:29:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsqq65J7DfL9UXxZSyHFQuCPd8aTGAxsO8aOSuhAZezpBEFwV1UWu5RBpOyR/1WkgjxJQoO88IXAdykbU/LcagsXYvuq08Slf899QQ/gmiX9FCglr4LgFbnExj5j2FIRtsTxlE80Zq+tKZunaAUDzv+RZjdDqTIQ4+vQtNJ1Izkx0VpOjewaB5QeoftbZJwiBG2U+0K5b0Xbs/5WfXajPi1wzSm5rDJirbj9d0aXf2mCzJnG24YsY9R5Ix3ANb5XoPo/RbuO4E81JA2cmggEd4Y+mn/hb4a8qyycTYE9LbxmOIuGzR99kxAEDDP4PHNJwtVZvzvytNWjtBiCg6a9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lgzce56w6w/LW3dhksydwCVzU3bIOhpmE/ESINnt8JA=;
 b=iLC8y1RQb85cwsMidbO8IbxKnHDLE/bxi1BbzHK5IXsYKqLioHTrSTiKrEGaMxgUrfOv62OvOEIk+19K7z8iGgAShy45/5oQbQPhd44N+P+fDiz6ZG05k6ye5aYUh3+GxOPRqC6FiPXxWvaOnIxsv6TCFAkA3UT5yyC/RaYGTuWhBokabTOrgorgcMSs8xwNwK/CPsOICK4ByYy1Y7q5GvQ9cijL2SHCwGqSXtSnR+koizCFyld5SkklGtr1dg7TSuKllwCXdK/lTGfpTJb0PqxnPv3U2p3BnvW984C9/xRQFmhCrw/i/1/IWdSpEW/ZGLUEFvJgDqrMxPDRP2HSPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lgzce56w6w/LW3dhksydwCVzU3bIOhpmE/ESINnt8JA=;
 b=A0bqeoZlsXA3IZJZashENO5qGMpHrvGHN9be//Y+0ABDgORMdWuTMUOWQ9lDUSfZXe6ccELR1yoI+Ak7DlC5J474laYMQ3EITpSjl+J1Fga5RY3zlIl5X7C+f8uzsPqnv09Q8Ja83QmlM0PxVzSywDQ3JUeHCZm8VYBhEgvKYCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB4323.jpnprd01.prod.outlook.com (2603:1096:604:37::10)
 by OSZPR01MB8372.jpnprd01.prod.outlook.com (2603:1096:604:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Sat, 17 Feb
 2024 13:14:25 +0000
Received: from OSAPR01MB4323.jpnprd01.prod.outlook.com
 ([fe80::46db:654a:ea70:d399]) by OSAPR01MB4323.jpnprd01.prod.outlook.com
 ([fe80::46db:654a:ea70:d399%6]) with mapi id 15.20.7292.029; Sat, 17 Feb 2024
 13:14:25 +0000
From: Steven Niu <steven.niu.uj@renesas.com>
To: alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: zbigniew.lukwinski@linux.intel.com,
	Steven Niu <steven.niu.uj@renesas.com>
Subject: [PATCH 1/2] dt-bindings: i3c-hub: Add Renesas RG3MxxB12A1 I3C HUB
Date: Sat, 17 Feb 2024 21:14:11 +0800
Message-Id: <20240217131412.4145506-1-steven.niu.uj@renesas.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: KL1PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::18) To OSAPR01MB4323.jpnprd01.prod.outlook.com
 (2603:1096:604:37::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB4323:EE_|OSZPR01MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef73c4d-7ad3-4ae8-1e01-08dc2fba5d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9T77FBpiPkAiTLvvRs487Kn6kvpzkzMD4PeZxfsZKCJewEy+6ZPobIO887T2VtLobJAtX/4WyuBHxbdkc6fH/QeNIovOykDfyelm+3ZtMXV0F1wypgHTEJ9DmyVaCxzDwhm7sPxthBPSQqzvMPhhnMMJIqzcn7Xqpw1U8O6rnooVUnYqPCX1MWXbXqV+eGRj8dEbD7rAZ+7YhCGWF5mnheifPIrP1pemFwQOp/TrSP+2AN+JDxcSJl0HubVgYgYUff//0yW6Bu9QitTUez7LGQauB3FaH/flSJ8W5N8R0gLPx9azglTAXnbnVmeFnn/ZBd2k8Ux2LHLNfeQbkpw0tFj7JOhGIbl3QIOcRsdagGSCs0ZXCKZYW7G2awX9b6Fr2+FpGEc++/dNPtuZLzRTxoaVipu1A8gQ36no3rDv1lZhQRsyf+OYaoWk3o3xZQ1+93Fsy0p7CFWbRDH9Gd2HaZkSvMQDTzw0ZMvBx8zHX0ji8DQfGxk29hgXnaYzBUcx3QH3j7MLqP4Ksy9t9JMmAOs/B6x5IOrD5+zCmvQAbFjuBCW7qQ2PPLaK2zwIj7w9niHqaGRQOcKb4egBx6ftdkHFJjGCTEsCSc56livrQE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB4323.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(230273577357003)(451199024)(1800799012)(64100799003)(186009)(103116003)(36756003)(86362001)(38100700002)(38350700005)(6666004)(83380400001)(2906002)(8936002)(4326008)(66946007)(66556008)(8676002)(66476007)(30864003)(5660300002)(966005)(6506007)(6512007)(6486002)(316002)(478600001)(52116002)(41300700001)(26005)(107886003)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TCfD7WNvTMKzny5qmSoj6mk2+IZdyY842A+c8/K/YQVrQCNHyJaht0QElq9C?=
 =?us-ascii?Q?wUkDI3aTcYfL1c8alVNiESMXnKKpiSsfeeWJ3ij2cOXFMyh72SRWF4KFOAwK?=
 =?us-ascii?Q?aZRusXAxVZFlcCwxGdeoOkhx1AGvC3qdtejE82v2TwyuliadWPTHoicQ17d8?=
 =?us-ascii?Q?Lz4Ea6r6Ch8WuPT/o9YFBY9v+Ps4oxChByIk0KyywJNjEkVVGQA1iZBkDIr2?=
 =?us-ascii?Q?+CKIC452iNuULgCqNrmVzCTKE7hVoLWkZDzgsA1GyTlw77qDD91GXybjGpra?=
 =?us-ascii?Q?v8m2tShz5I4WKl1hRHrrb/TvrJ4CBE5Rc3fOWb7Rx3vrYL4XoyzninR0M3xg?=
 =?us-ascii?Q?6rdoc+a1t5lPTASoUjIrD5fuvDcCQ2iyA/mCqy/G4YB8VeCQbPBvQieC4zeX?=
 =?us-ascii?Q?hg8W6NOGffe3o0Ty+As8OdZE8AKjpGTJ/x7mkwzNM7ye57ZlzBtDe8lCSZ60?=
 =?us-ascii?Q?tWVVkjA5ES4MXQdvffpjwA+SuNR62+v8byELDkpo6x0eBiSMZ9/FaZTyFrPx?=
 =?us-ascii?Q?ZMIQR4UzQWe+PiNVpkui5p5ARqaxQusOauwpiQYQdQgGKSp6rETQaCMyB8OS?=
 =?us-ascii?Q?DG+JnuOhGHDfyRjc8b5vUNOx6OEgWk5g4xTDD0xnICcvm5TAw6tqjHNtjfcr?=
 =?us-ascii?Q?XXdNvsIUYn0kUZ2HbpxlpssSLXp474fJHZ14xLsPEV6lNTkUDxRzkiB4/1qb?=
 =?us-ascii?Q?Jap1sF5Cx9wjBWlnsDxFjfv+yZUCNtXjDM+vmpVNHnikOAdG+5vU9Or/RBlu?=
 =?us-ascii?Q?tudCH0BJxuRe+Ute5BzlHFal7F9uFywOcImrdWKn8UHxd4b8sukyFkezZd8A?=
 =?us-ascii?Q?wbsXInnCxUnt8EKWmS/bASYJ3Bo3dCmmHGOaEOcdZ848LOg0NMirB4RAytVP?=
 =?us-ascii?Q?ZZ8oh1U/40rH3r7qik7G2K0K4N/sVnzGP0NaunpRUYKoxWwu3QV0eeQUke4O?=
 =?us-ascii?Q?cc6NbGPMwfMqmiDySzhkAyu8godSRcxH8LTeccAVnHR74vkBLxo64OHR3Ce4?=
 =?us-ascii?Q?5VV0Qh6P+kJjHm3ivTb2YUKiNLrY0/MwR6zKcsGAsjer9GWuMsl0Jm+67k2Q?=
 =?us-ascii?Q?tmlkBM9d3Gk8s0fSiHdADxQR/nzSsg3ej9S4p+kJteddKS0bhdYKATzrpEHV?=
 =?us-ascii?Q?1nVDSfQ/vo7eopVU8KgoI0nfJ+EvG8TidzCtJALvhMUAXrdp0YYeYk2axWUN?=
 =?us-ascii?Q?UuWbk6Zawma6+tjnkSef59jHMtOurikdSL+yV+lfCVMuB7Y1W2FSVWJSsIBb?=
 =?us-ascii?Q?r9ToHCd7PcAfo8TDJi0jnqnF47XGVLWhhf1bGRJw8diw6yG8sNO57AdUGPpM?=
 =?us-ascii?Q?xY2SSiwkdEDbWBzoqkJG9F8nNZ0KNAD+r06Hl9ZUufFUcvsqS7qI7bdy04+q?=
 =?us-ascii?Q?cS0ytu46ClkO1E5PG50EZdL6jlOw+8tboAW7tWxVTEb0R8nnWR2asHajZ023?=
 =?us-ascii?Q?RNCZirvnEfWqqVifUSUrJdRp9nGlJVAmee7p0KtaW0FPaHqs42JM+Wjy3Hxx?=
 =?us-ascii?Q?vDoRs9g+0eWqxG5uXXc6j32uJV/z9kV8sZWItQm9/FigfsGRtjqFfWFaTOVu?=
 =?us-ascii?Q?8oewsCZ6v5k9MbQ64hHGQhvxMgZNS/0TvqEUBfzYjfaFcw9/D4uIVjzZyOTH?=
 =?us-ascii?Q?rA=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef73c4d-7ad3-4ae8-1e01-08dc2fba5d3a
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB4323.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2024 13:14:25.6431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSDAvyAVNcSNgCzB5BbNhtIyvXJNBSAFN3pBkLRiQFtoJ/LTS/FYmo9uxTZ040Znmsrc2lmyT9FLELR9VApSJ8YT5O5oISWSGi03gRMHQF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8372
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_052917_178844_5BD12F16 
X-CRM114-Status: GOOD (  14.40  )
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

Document the Renesas RG3MxxB12A1 I3C HUB.

Signed-off-by: Steven Niu <steven.niu.uj@renesas.com>
---
 .../devicetree/bindings/i3c/i3c-hub.yaml      | 400 ++++++++++++++++++
 1 file changed, 400 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/i3c-hub.yaml

diff --git a/Documentation/devicetree/bindings/i3c/i3c-hub.yaml b/Documentation/devicetree/bindings/i3c/i3c-hub.yaml
new file mode 100644
index 000000000000..8ff6ca172975
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/i3c-hub.yaml
@@ -0,0 +1,400 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I3C HUB
+
+maintainers:
+  - Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
+  - Steven Niu <steven.niu.uj@renesas.com>
+
+description: |
+  I3C HUB is smart device which provides multiple functionality:
+  * enabling voltage compatibility across I3C Controller and Target devices,
+  * bus capacitance isolation
+  * address conflict isolation
+  * I3C port expansion
+  * two controllers in a single I3C bus
+  * I3C and SMBus device compatibility
+  * GPIO expansion
+
+  Having such big number of features, there is a need to have some DT knobs to tell the I3C HUB
+  driver which features shall be enabled and how they shall be configured. I3C HUB driver read,
+  validate DT knobs and set corresponding registers with the right way to satisfy user requests from
+  DT.
+
+  All the DT properties for I3C HUB are located under dedicated (for I3C HUB) DT entry. I3C HUB DT
+  entry structure is aligned with regular I3C device DT entry described in i3c.yaml.
+
+allOf:
+  - $ref: i3c.yaml#
+
+properties:
+  $nodename:
+    pattern: "^hub@0,0$"
+
+  cp0-ldo-en:
+    enum:
+      - disabled
+      - enabled
+    description: |
+      I3C HUB Controller Port 0 LDO disabling/enabling setting. If enabled, voltage produced by
+      on-die LDO will be available externally on dedicated pin. This option could be used to supply
+      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
+
+      This property is optional. If not provided, LDO will be disabled.
+
+  cp1-ldo-en:
+    enum:
+      - disabled
+      - enabled
+    description: |
+      I3C HUB Controller Port 1 LDO disabling/enabling setting. If enabled, voltage produced by
+      on-die LDO will be available externally on dedicated pin. This option could be used to supply
+      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
+
+      This property is optional. If not provided, LDO will be disabled.
+
+  tp0145-ldo-en:
+    enum:
+      - disabled
+      - enabled
+    description: |
+      I3C HUB Target Ports 0/1/4/5 LDO disabling/enabling setting. If enabled, voltage produced by
+      on-die LDO will be available externally on dedicated pin. This option could be used to supply
+      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
+
+      This property is optional. If not provided, LDO will be disabled.
+
+  tp2367-ldo-en:
+    enum:
+      - disabled
+      - enabled
+    description: |
+      I3C HUB Target Ports 2/3/6/7 LDO disabling/enabling setting. If enabled, voltage produced by
+      on-die LDO will be available externally on dedicated pin. This option could be used to supply
+      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
+
+      This property is optional. If not provided, LDO will be disabled.
+
+  cp0-ldo-volt:
+    enum:
+      - 1.0V
+      - 1.1V
+      - 1.2V
+      - 1.8V
+    description: |
+      I3C HUB Controller Port 0 LDO setting to control the Controller Port 1 voltage level. This
+      property is optional.
+
+      If not provided, LDO configuration is not modified in I3C HUB.
+
+  cp1-ldo-volt:
+    enum:
+      - 1.0V
+      - 1.1V
+      - 1.2V
+      - 1.8V
+    description: |
+      I3C HUB Controller Port 1 LDO setting to control the Controller Port 1 voltage level. This
+      property is optional.
+
+      If not provided, LDO configuration is not modified in I3C HUB.
+
+  tp0145-ldo-volt:
+    enum:
+      - disabled
+      - 1.0V
+      - 1.1V
+      - 1.2V
+      - 1.8V
+    description: |
+      I3C HUB Target Ports 0/1/4/5 LDO setting to control the Target Ports 0/1/4/5 voltage level.
+
+      If not provided, LDO configuration is not modified in I3C HUB.
+
+  tp2367-ldo-volt:
+    enum:
+      - disabled
+      - 1.0V
+      - 1.1V
+      - 1.2V
+      - 1.8V
+    description: |
+      I3C HUB Target Ports 2/3/6/7 LDO setting to control the Target Ports 2/3/6/7 voltage level.
+
+      If not provided, LDO configuration is not modified in I3C HUB.
+
+  tp0145-pullup:
+    enum:
+      - disabled
+      - 250R
+      - 500R
+      - 1k
+      - 2k
+    description: |
+      I3C HUB Target Ports 0/1/4/5 pull-up setting to control the Target Ports 0/1/4/5 pull-up
+      resistance level.
+
+      This property is optional. If not provided, pull-up configuration is not modified in I3C HUB.
+
+  tp2367-pullup:
+    enum:
+      - disabled
+      - 250R
+      - 500R
+      - 1k
+      - 2k
+    description: |
+      I3C HUB Target Ports 2/3/6/7 pull-up setting to control the Target Ports 2/3/6/7 pull-up
+      resistance level.
+
+      This property is optional. If not provided, pull-up configuration is not modified in I3C HUB.
+
+  cp0-io-strength:
+    enum:
+      - 20Ohms
+      - 30Ohms
+      - 40Ohms
+      - 50Ohms
+    description: |
+      I3C HUB Controller Port 0 IO strength setting to control the Controller Port 0 output driver
+      strength.
+
+      This property is optional. If not provided, IO strength configuration is not modified in I3C
+      HUB.
+
+  cp1-io-strength:
+    enum:
+      - 20Ohms
+      - 30Ohms
+      - 40Ohms
+      - 50Ohms
+    description: |
+      I3C HUB Controller Port 1 IO strength setting to control the Controller Port 1 output driver
+      strength.
+
+      This property is optional. If not provided, IO strength configuration is not modified in I3C
+      HUB.
+
+  tp0145-io-strength:
+    enum:
+      - 20Ohms
+      - 30Ohms
+      - 40Ohms
+      - 50Ohms
+    description: |
+      I3C HUB Target Ports 0/1/4/5 IO strength setting to control the Target Ports 0/1/4/5 output
+      driver strength.
+
+      This property is optional. If not provided, IO strength configuration is not modified in I3C
+      HUB.
+
+  tp2367-io-strength:
+    enum:
+      - 20Ohms
+      - 30Ohms
+      - 40Ohms
+      - 50Ohms
+    description: |
+      I3C HUB Target Ports 2/3/6/7 IO strength setting to control the Target Ports 2/3/6/7 output
+      driver strength.
+
+      This property is optional. If not provided, IO strength configuration is not modified in I3C
+      HUB.
+
+  id:
+    enum:
+      - 0
+      - 1
+      - 3
+    description: |
+      I3C HUB ID based on CSEL pin. There are three possible values:
+      0 - CP0 is selected as primary Controller Port
+      1 - Primary Controller Port is selected by software by writing the REG#56
+      3 - CP1 is selected as primary Controller Port
+
+      I3C HUB driver reads CSEL pin status (REG#121[5:4]) and tries to find DT node with matching
+      value in 'id' property.
+
+      This property is optional. If not provided, DT node can only be used by the I3C HUB driver if
+      there is no others with matching 'id' or 'id-cp1'. If there is a multiple DT nodes with no
+      'id' property - the first one will be chosen by I3C HUB driver. If there is a multiple DT
+      nodes with matching 'id' property - the first one will be chosen by I3C HUB driver.
+
+      If both 'id' and 'id-cp1' are available, DT node will chosen only when both values match those
+      read from I3C HUB.
+
+  id-cp1:
+    enum:
+      - 0
+      - 1
+      - 2
+      - 3
+    description: |
+      I3C HUB ID based on CP1 SDA and SCL pins state probed during power on.
+
+      I3C HUB driver reads CP1 SDA and SCL pin status and tries to find DT node with matching value
+      in 'id-cp1' property.
+
+      This property is optional. If not provided, DT node can only be used by the I3C HUB
+      driver if there is no others with matching 'id' or 'id-cp1'. If there is a multiple DT nodes
+      with no 'id-cp1' property - the first one will be chosen by I3C HUB driver. If there is a
+      multiple DT nodes with matching 'id-cp1' property - the first one will be chosen by I3C HUB
+      driver.
+
+      If both 'id' and 'id-cp1' are available, DT node will chosen only when both values match those
+      read from I3C HUB.
+
+patternProperties:
+  "@[0-9]$":
+    type: object
+    description: |
+      I3C HUB Target Port child, should be named: target-port@<target-port-id>
+
+    properties:
+      mode:
+        enum:
+          - disabled
+          - i3c
+          - smbus
+          - gpio
+        description: |
+          I3C HUB Target Port mode setting to control Target Port functionality.
+
+          This property is optional. If not provided, Target Port mode configuration is not modified
+          in I3C HUB.
+
+      pullup:
+        enum:
+          - disabled
+          - enabled
+        description: |
+          I3C HUB Target Port pull-up setting to disable/enable Target Port pull-up.
+
+          This property is optional. If not provided, Target Port pull-up configuration is not
+          modified in I3C HUB.
+
+      always-enable:
+        type: boolean
+        description: |
+          I3C HUB Target Port settings to control the port enable/disable policy.
+
+          This property is optional. If not provided, Target Port is enabled only on accessing to
+          the devices connected to it and the port is disabled automatically after the accessing
+          is done. If provided, the Target Port is always enabled.
+
+    patternProperties:
+      "@0,0$":
+        type: object
+        description: |
+          Backend for handling SMBus mode, should be named: backend@0,0
+          Adding this node installs the backed for handling SMBus Target mode communication.
+
+        properties:
+          compatible:
+            description:
+              Compatible of the I2C/SMBus backend.
+
+          target-reg:
+            description:
+              Target address used for Target Port in the I3C HUB configured as SMBus Target mode.
+
+additionalProperties: true
+
+examples:
+  - |
+    i3c-master@d040000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hub@0,0 {
+        cp0-ldo-en = "disabled";
+        cp1-ldo-en = "enabled";
+        cp0-ldo-volt = "1.0V";
+        cp1-ldo-volt = "1.1V";
+        tp0145-ldo-en = "enabled";
+        tp2367-ldo-en = "disabled";
+        tp0145-ldo-volt = "1.2V";
+        tp2367-ldo-volt = "1.8V";
+        tp0145-pullup = "2k";
+        tp2367-pullup = "500R";
+        tp0145-io-strength = "50Ohms";
+        tp2367-io-strength = "30Ohms";
+        cp0-io-strength = "20Ohms";
+        cp1-io-strength = "40Ohms";
+
+        target-port@0 {
+          mode = "i3c";
+          pullup = "enabled";
+          always_enable;
+        };
+        target-port@1 {
+          mode = "smbus";
+          pullup = "enabled";
+          backend@0,0{
+              compatible = "slave-mqueue";
+              target-reg = <0x10>;
+          };
+        };
+        target-port@2 {
+          mode = "gpio";
+          pullup = "disabled";
+        };
+        target-port@3 {
+          mode = "disabled";
+          pullup = "disabled";
+        };
+      };
+    };
+
+  - |
+    i3c-master@d040000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hub@70,3C000000100 {
+        reg = <0x70 0x3C0 0x00000100>;
+        assigned-address = <0x70>;
+        dcr = <0xC2>;
+
+        cp0-ldo-en = "disabled";
+        cp1-ldo-en = "enabled";
+        cp0-ldo-volt = "1.0V";
+        cp1-ldo-volt = "1.1V";
+        tp0145-ldo-en = "enabled";
+        tp2367-ldo-en = "disabled";
+        tp0145-ldo-volt = "1.2V";
+        tp2367-ldo-volt = "1.8V";
+        tp0145-pullup = "2k";
+        tp2367-pullup = "500R";
+        tp0145-io-strength = "50Ohms";
+        tp2367-io-strength = "30Ohms";
+        cp0-io-strength = "20Ohms";
+        cp1-io-strength = "40Ohms";
+
+        target-port@0 {
+          mode = "i3c";
+          pullup = "enabled";
+          always-enable;
+        };
+        target-port@1 {
+          mode = "smbus";
+          pullup = "enabled";
+          backend@0,0{
+              compatible = "slave-mqueue";
+              target-reg = <0x12>;
+          };
+        };
+        target-port@2 {
+          mode = "gpio";
+          pullup = "disabled";
+        };
+        target-port@3 {
+          mode = "disabled";
+          pullup = "disabled";
+        };
+      };
+    };
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
