Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C05CAC59A
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Sep 2025 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvJ757ptPiBU6hdgg8bQaE0D4HnXWc6gSkqn89HIsOw=; b=WmQnGS2eIL3Q29
	GGoPkovMfmAsnApO6+k353zBpzJckJy9emmuBk6q7bhwhxsxWoAzCObVprkhSWYznwxwnRaVqvv1O
	rGJnFMwU9Zw/mBzI5HjGBr4HpGhkPqXLDVOFjOZGhjXMPdChOSiB4w2zLo2Cc5TskRxxpEWNPuYF3
	xDWFhacCQeWEUH700P0VjLhSLFwkzPqX7McpnrW3yt10Ah+mQh/ZPVCfRZVOB2bX7RjEauonmOP/d
	zZOc4ZkBBvx13wWW280bIJIcAGdIFkhO6VbjdY0TJdssU1dHRItIKxkmhIUYSYif+zvE4Nv6nWWwV
	kvK4o5hT19CN5aPdS/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyt2S-0000000CARm-2JsJ;
	Wed, 17 Sep 2025 14:21:40 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyt26-0000000CADa-2Wgr
	for linux-i3c@lists.infradead.org;
	Wed, 17 Sep 2025 14:21:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYTcfF1Pxr28cVeB4Xz71uHo0Yt3a2dsbBeBQIsDlquMaBlo+DdcQ9+yE7fq+VvkVrcgYgYtMoTpABA34poZfiAxdYCs2Zs+Gsq/Ixf392m0vgdSECkIAY8ImtBnCHzRNfgQYMk1a0ZUrJqYvH2lwOzkO9XlGFLu321KBMDda2tY1etGH7TozwjjwtlKs7EKjsIjat8cAKk1slEZ32DDzzHLqc/4uARmGdYd0c3WRYUjwr9kHL/zPGftYtss/M9PbAKk19NZc6lGl3bRWjxh7pe3pNXBZcBI4J+pJvelS/Ron5JrXMU0ReftwEpA1SETZoQGon3wuCB4r8hyx+gR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtZhSdoLBK+n2WL3gXUTldMPBl7o5pizHwYiUfoLLq0=;
 b=SF1thHxJSQsaZRJuerQnWtUCh5q/IwNvtQhJDfnwh5Ud6kwG0v8K7TnjgHNQfbmpAcO04LLi+qNOE+hM1hNs5zM6YxeADiMGmROrCN8IpQejI0qZmNMLYSf8PPhBtBCYtS1CGXAUwp+jcSarDxjXCIuEIpgj30gVVNVx8wJ9GJjdAe8b5YOliH0WqORF+F1A2OXnw9QRkFzbeNjwMXQhpVBEQdJOfYrf06lgyUpKp5NRl8otOgLnbI3E8eXUbGk1zD9JRc/YOOw2qBZEvhjI6dUpgjCFzUYuU0Wv0KEXmjtYN9JkSuskl6QS2yRCBA5l6/Acy26spGissepDFHCQTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtZhSdoLBK+n2WL3gXUTldMPBl7o5pizHwYiUfoLLq0=;
 b=kjZFOasD+2xVjBMhOII7AG6YRWtCJ8WcE7OjcNkRcwwqfZYT8HIe76fKQIP/+lSK64d4qqG1CcvaZPG+8qJN9kAr7NCAjjMR0Mp4WMeqcTDgMw0ARO57fCVxMpLHdNrB3UdVWxkgS/oM6oRo2zvjKYIYo3hfK9et2XdEysXv8EE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB10513.jpnprd01.prod.outlook.com
 (2603:1096:400:2f5::14) by TYWPR01MB10839.jpnprd01.prod.outlook.com
 (2603:1096:400:2a9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 14:21:07 +0000
Received: from TYYPR01MB10513.jpnprd01.prod.outlook.com
 ([fe80::6333:35d0:7245:4c26]) by TYYPR01MB10513.jpnprd01.prod.outlook.com
 ([fe80::6333:35d0:7245:4c26%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 14:21:07 +0000
From: Steven Niu <steven.niu.uj@renesas.com>
To: alexandre.belloni@bootlin.com
Cc: zbigniew.lukwinski@linux.intel.com,
	linux-i3c@lists.infradead.org,
	Steven Niu <steven.niu.uj@renesas.com>
Subject: [PATCH v2 1/2] dt-bindings: i3c: Add i3c-hub support.
Date: Wed, 17 Sep 2025 22:20:54 +0800
Message-Id: <20250917142055.2806576-1-steven.niu.uj@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240217131412.4145506-1-steven.niu.uj@renesas.com>
References: <20240217131412.4145506-1-steven.niu.uj@renesas.com>
X-ClientProxiedBy: TYCP286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::10) To TYYPR01MB10513.jpnprd01.prod.outlook.com
 (2603:1096:400:2f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB10513:EE_|TYWPR01MB10839:EE_
X-MS-Office365-Filtering-Correlation-Id: d846612b-08ab-41cf-bdcc-08ddf5f570e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AzYtymG4WG8TFB0PqHX5rFUrBY4dRCDvp7TBJWEj6cVB0D/L9KX2e+z3E2ra?=
 =?us-ascii?Q?5Z91VQ9j1wJD6qzsBrRhAeQ+w64IfUaHWqETZJ5L5gH3m0iFf6PO1UzFE1TW?=
 =?us-ascii?Q?PmtDHPy8FWOr7inNPL1n2rUQIxXsOcPtuGjShnsw4GwFIXn6xzFPlJ2gK1ul?=
 =?us-ascii?Q?ARyFPZy6axHKYoiFthDd68lhdkFkBkbhbEElKX12cedIviT9Ttifo27LE4dm?=
 =?us-ascii?Q?agjn750D79YSkCi6n7zYVV1T8lxHkbqEmPISI4XFdF7R3q3dLxfXWtMJaHbR?=
 =?us-ascii?Q?It7JV1TorriS7/cOR9uxTG0mcZBIpD/6gUAY7dkR5yZImuSOAhRJxpXm6OE3?=
 =?us-ascii?Q?ej5yv1qm97BDx9E+v/0UUY2s/x7VyStDqacHQx+HgV5aSc70j2kVS1f8TTkC?=
 =?us-ascii?Q?3VtOIEvA+/XfeAoBnDtNu4PrF+A1vvNLVXFFiwrkfvKy7/qbTKScOdwMSdh+?=
 =?us-ascii?Q?QmrI9L/ozO5P4uwR3qVCsfGmcVW8Gcq5wXOrCkOwOwoHpuwySd48GAnPseVg?=
 =?us-ascii?Q?W/UTA7KngtrWheR+wbgEM44No2emm5BKiE96r0ZJsRgagx5rWaz8bKjhcV9U?=
 =?us-ascii?Q?DJ6UWf8jXDiysOzREr9CknSH7C3HmgjrnxFhj1nGocLqGDY0RR/3CHMXa0i1?=
 =?us-ascii?Q?IAdaawglVqIUW6w7u6VXjEAzwZ5Ixrg1vFH2OkWI4UU4eJ3I0fhqQ3wE6Vq0?=
 =?us-ascii?Q?TQp9NuPT8rrEq9B0s/iBfjQt8Lglb0oGHeRYt4mTPHKZW5kvunN99wqOLtCs?=
 =?us-ascii?Q?e1YvMQLTXD1RrsefvbXvN17N2+HYQ80VCX46LkFZserMMO83jkflAlxPjiLQ?=
 =?us-ascii?Q?B2Rwwhdwke8abJmJJj9pjNDKMdQwRR+iCk19HFMVgGfLQeyv2WxaALIBsH+a?=
 =?us-ascii?Q?mngwuroMP3Wp0J+EkYwSDL9jfGlSaObDrmMwDguCTh6ZcwFzCtvQPPsmL64x?=
 =?us-ascii?Q?iPSTBYI/+DTc6dGWvMwCkp9XJMGCApSQFIyMx37f5EzetpEnb9iuccGKi1XZ?=
 =?us-ascii?Q?BzFdmK65dCsmsio8+74cEtl8hVG6vHiZts7s65weGckT20jDb91zOk5snxqE?=
 =?us-ascii?Q?IEVu+Ks4wDPUcGbNt5uA3pNMDzCw6BQPLriLyCdhYAdM6OzMxpGbFkw4b+t9?=
 =?us-ascii?Q?Ja5veY1J2Bkk6JE5+4rU6wkE4Qo9U+5/Qb6ASKntsh5sr154kWg7LUJRKn3o?=
 =?us-ascii?Q?dMGkVH18lWwT4hpGZeSaqdcOSn1rBfObCm8s8wPe8rZgObma5b/2e7N/VMZX?=
 =?us-ascii?Q?HSHi+r6GhBVPwW9jk540IB4v6t8bBHsK98DabnA5otBfFw4h7DZii+ZsyzPR?=
 =?us-ascii?Q?XjJk+Fu0GGdXr68VCtgo31Nf/EE49Yh83NJhAlf3/tZBwYPGGE8g8kMe4Y3M?=
 =?us-ascii?Q?7Oel0uboZPz3l9SExW534LPZC2MB38fX806UHYX0xb4w+RewLfTISPbLRoj6?=
 =?us-ascii?Q?RowFPyS3K/8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB10513.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r/0mfLdxLjgjHZ7hJ4fGpWu+3wsR+w2f90qFCYw8w4ZZEL268lLFZY1CMn+s?=
 =?us-ascii?Q?oFjroagRfzRisxqgg1EC9po/cAUYMXtjrww+Gijt427CYLUkxbPodF7f4NLP?=
 =?us-ascii?Q?tf8sR4RW7QADj6eIv3imd9AP7xXf8V4wA+Y0HRS+k1eiiRLjL67cfYXPE77q?=
 =?us-ascii?Q?/jqRxE9gmzYx+oh7+m0qyyNbJjcDJe1eIz+c9r+u3saNRww4J0EoI3/oQYy+?=
 =?us-ascii?Q?Q9dA0nECwXw81L3lyLwwEsWCPuex1NJnKEXeTeXocLHHOnhOyB1QVXF1jdAy?=
 =?us-ascii?Q?nec83qNqIBtp2jTa6Xly4AQs/SicnmRj++zehn6jhsdL/nqC/GixHBpSjzVj?=
 =?us-ascii?Q?co+wB1pFKOWGEnynaCbqK0Kv9dTlDcIPHaleRnTe9y16deaNwskSp8QJDnPm?=
 =?us-ascii?Q?L3uVIzD6iuhul81MP6D02QirwxpexR8Hr4LeQ2JsYGZikJipwKFC58OUqRAa?=
 =?us-ascii?Q?SW/0Gwn2sMGV2/XffRBcISVq1Yqk1UUvWJ/UN1wP0CbXTeiSrxSGTHvMSoXp?=
 =?us-ascii?Q?cZ5Qa1LfUGaenMroIqxxhPTiZkt39EeuI5Uf/yq53w6YmVvqELvum0l76Cbj?=
 =?us-ascii?Q?IURJWmRfoWfh+LZWmhnQmUuMUSbn4fkErUNvy5xJnliFlQqDy9jt2PrfhWh+?=
 =?us-ascii?Q?88MoSm3UjSM8lDvMNa/mVN7phtm8cyxUeDPcdDrfKnPKeZOVqU/X3m9eH9ZU?=
 =?us-ascii?Q?eB3yec5nkuPnMMbliTGVFzfC7TQlawioR9H02ZKSsbj/aHmT/feW/S109WEQ?=
 =?us-ascii?Q?TfWcCetNMHcZ3MqsB3iNWZwnz5qBLdnQNb7eM4AEj3EgFM8tjOoB5fg6nwXw?=
 =?us-ascii?Q?yi9j/3vwOWpUEcMoIhdob/Qto3x8zkAFP86VtozZSTkqvMFhpGvKqM+ox9iA?=
 =?us-ascii?Q?y80VkpbHtMG8oxY+3kTGI2fFT1aHeMT0W5qzWdolyLN3db5kZlRwo3Yzyw96?=
 =?us-ascii?Q?shERuQNRzii+HT0Wnyfdl1qJ1xFURznBw+h0YH7RqF3MJBuHxijhCPTfypQL?=
 =?us-ascii?Q?imGMxvjfJ/Xa0gjyjwgiNEIJHxR1zI48J62hGHK4MWXDhHRd7mZ3+rNBHvm+?=
 =?us-ascii?Q?bGAN9h0v4Ctpp/NLm4Es2uoYzCrYF98kf73Dv1qJyr5RkWrN2UGem3lZKXPb?=
 =?us-ascii?Q?MGsXEN0R6r6NwEfexVtzAcCtsTNVEc9nJJCVKO96Ra84OhSkAp8fykDrPxEv?=
 =?us-ascii?Q?w2THmKSjhIrKCeoAUhgpVkaR2LYOkc3xaGZVZrC6TMTBPMpxEI8cM/Fad/qp?=
 =?us-ascii?Q?8bN29HiGbh9jl6ijLnFWMdV4Cw5VfZG8wvtwDaAGhGcT5fpld0h8q60PZZgZ?=
 =?us-ascii?Q?EEA/PUEnji/wO1TmcvOXHTUwn4/1KA+WcnTLQhOPeOGbrt7LfcVWmgokuPxJ?=
 =?us-ascii?Q?a6xFXtDkmUuRfJtjPu3C/HFWrA4MY5sBnV+iW2n9pSdAgHce5b9rC/pFxDLc?=
 =?us-ascii?Q?3CjzbHxaNV/EdK+/glD7vEDFcb3rKoIzb1D8DZ64A8VDVXJifcBNGNB9jQU9?=
 =?us-ascii?Q?pTZKnjwVFFyU8qBfvyjwf5/4V1gS5f15bL7CNfd8aKlSATZyhcDiIeVyHvsi?=
 =?us-ascii?Q?VE9apZp/AcAjfzcUFFetHM3yKBzStXU9mKwqLP8Iwm06amsQKI05JMn1H6ms?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d846612b-08ab-41cf-bdcc-08ddf5f570e1
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB10513.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:21:07.0318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39a7zYsZjR9aEAU5We8GOY1sWIJJXxpxChphYhYIOeTsHAFCZywnxLdv6855ivC4U2LfkGzJG1YC/A98yCCVTqseyKdyEpeyS2rNzUtHajE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_072133_361374_6B3DF1E9 
X-CRM114-Status: GOOD (  16.33  )
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

Add device tree binding documentation for the i3c hub devices which follows
the Intel I3C hub specification.

Signed-off-by: Steven Niu <steven.niu.uj@renesas.com>

---
Changes for V2:
- Group the device device characteristics into groups:
  - control-port
  - target-group-x
  - target-port-x
---
---
 .../devicetree/bindings/i3c/i3c-hub.yaml      | 261 ++++++++++++++++++
 1 file changed, 261 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/i3c-hub.yaml

diff --git a/Documentation/devicetree/bindings/i3c/i3c-hub.yaml b/Documentation/devicetree/bindings/i3c/i3c-hub.yaml
new file mode 100644
index 000000000000..c5af39b031ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/i3c-hub.yaml
@@ -0,0 +1,261 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
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
+  The I3C Hub is a family of I2C/I3C 2-to-N Hub devices. An I3C Hub device
+  provides connectivity to up to two control ports, and up to eight target
+  ports. By cascading and duplicating the i3c hub, the user can build a hub
+  network to provide connectivity to a number of devices, with extended reach
+  distance, and running with different level of I2C, I3C, and SMBus protocols.
+
+  I3C Hub Spec:
+  https://www.intel.com/content/www/us/en/content-details/823670/i3c-hub-device-specification.html
+
+allOf:
+  - $ref: i3c.yaml#
+
+properties:
+  $nodename:
+    pattern: "^hub@0,0$"
+
+  compatible:
+    enum:
+      - renesas,rg3mxx
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  id-csel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The input settings of CSEL pin. This can be used to idendify the i3c hub
+      in a hub network with mulitple i3c hub hardware instance.
+    enum: [0, 1, 3]
+
+  id-cp1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The input settings of control port 1 SCL & SDA pin. This can be used to
+      idendify the i3c hub in a hub network with mulitple i3c hub hardware
+      instance.
+    enum: [0, 1, 2, 3]
+
+  id-tpx:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The input settings of target port[n] SCL & SDA pin. This can be used to
+      idendify the i3c hub in a hub network with mulitple i3c hub hardware
+      instance.
+    enum: [0, 1, 2, 3]
+
+  control-port:
+    description:
+      Control port configuration.
+    $ref: '#/$defs/control-port'
+
+  target-group-0:
+    description:
+      Target group 0 configuration.
+    $ref: '#/$defs/target-group'
+
+  target-group-1:
+    description:
+      Target group 1 configuration.
+    $ref: '#/$defs/target-group'
+
+patternProperties:
+  "target-port@[0-7]$":
+    type: object
+
+    description:
+      Child nodes used to configure target port.
+
+    properties:
+      compatible:
+        oneOf:
+          - items:
+              - enum:
+                  - i3c-hub-i3c
+                  - i3c-hub-smbus
+                  - i3c-hub-auto
+
+      reg:
+        description:
+          Target port identifier.
+        enum: [0, 7]
+
+      io-internal-pullups-disable:
+        description:
+          Select whether to disable the internl pullups on I3C signals.
+        type:
+          boolean
+
+      idle-disconnect:
+        description: The target port will be disconnected automatically when
+          there is no bus activity.
+        type: boolean
+
+      clock-frequency:
+        description:
+          Select the clock frequency of SMBus Agent Tx function.
+        enum: [100000, 200000, 400000, 1000000]
+
+      device-scan-delay-ms:
+        description:
+          The delay time in milliseconds between target port being enabled and
+          the device scan prodeucre.
+          This attribute is only applicable when the target port is configured
+          as i3c mode.
+
+    additionalProperties: false
+
+required:
+  - dcr
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+$defs:
+  control-port:
+    type: object
+    description:
+      Child nodes used to configure control port.
+
+    properties:
+      port-name:
+        description:
+          Name of the control port
+        enum:
+          - CP0
+          - CP1
+
+      io-microvolt:
+        description:
+          Select the i3c signal voltage level for the control port
+        enum: [1000000, 1100000, 1200000, 1800000]
+
+      io-strength-ohms:
+        description:
+          Select the io drive strength for control port
+        enum: [20, 30, 40, 50]
+
+      vio-source:
+        description:
+          Select the source of VIO supply.
+        enum:
+          - external
+          - internal
+
+    required:
+      - port-name
+
+  target-group:
+    type: object
+
+    properties:
+      io-microvolt:
+        description:
+          Select the i3c signal voltage level for the control port
+        enum: [1000000, 1100000, 1200000, 1800000]
+
+      io-strength-ohms:
+        description:
+          Select the io drive strength for control port
+        enum: [20, 30, 40, 50]
+
+      io-internal-pullups-ohms:
+        description:
+          Select the internal pullup resister value if the internal pullups are
+          enabled for the target port.
+        enum: [250, 500, 1000, 2000]
+
+      vio-source:
+        description:
+          Select the source of VIO supply.
+        enum:
+          - external
+          - internal
+
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i3c@0 {
+      reg = <0x0d040000 0x1000>;
+      #address-cells = <3>;
+      #size-cells = <0>;
+
+      hub@0,4cc00000000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        reg = <0x0 0x4cc 0x0>;
+
+        control-port {
+          port-name = "CP0";
+          io-microvolt = <1000000>;
+          io-strength-ohms = <20>;
+          vio-source = "external";
+        };
+
+        target-group-0 {
+          io-microvolt = <1000000>;
+          io-strength-ohms = <20>;
+          io-internal-pullups-ohms = <500>;
+          vio-source = "internal";
+        };
+
+        target-group-1 {
+          io-microvolt = <1800000>;
+          io-strength-ohms = <20>;
+          io-internal-pullups-ohms = <1000>;
+          vio-source = "internal";
+        };
+
+        target-port@0 {
+          compatible = "i3c-hub-i3c";
+          reg = <0>;
+
+          device-scan-delay-ms = <2>;
+        };
+
+        target-port@1 {
+          compatible = "i3c-hub-i3c";
+          reg = <1>;
+          io-internal-pullups-disable;
+          device-scan-delay-ms = <2>;
+          idle-disconnect;
+        };
+
+        target-port@2 {
+          compatible = "i3c-hub-smbus";
+          reg = <2>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+          clock-frequency = <100000>;
+        };
+
+        target-port@3 {
+          compatible = "i3c-hub-smbus";
+          reg = <3>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+          clock-frequency = <400000>;
+        };
+      };
+    };
+...
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
