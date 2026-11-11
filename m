Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E5660A260E
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2026 03:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rGnQUgZ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iYGWWYwubgjpsngQcc2qptmpcv89sTAtUDb5cDLdlaQ=; b=rGnQUgZ3bZs8UOBmy/zm7Fmofa
	RYesPLbvswFknig4PHaFtG5Q41/1QdWUtH2XygrthjQAKem88aUpB1tZz/2OUU0/2UqaVGTpcS8Lj
	XE+ja5syG0ufKh8x4zWLk5tpA83eeDlN4n2vRUIus+WeBFYcGCrS45W/3TOsczS9XyXmK/YITcGOV
	rj1cKsL3qqhc0mn5a1gTKL73efFeV00hq+enO0u+7/a+wE7/f6tkgxpoY1KdgXWKjuaPuD494b8XM
	5l+pdXx6ZDhY3Z41c4S9g4/GnAQD7uFWDjkGUdgxU21sbb0Td0E0OC8CrvCC23Tc7m+B3klDtvZov
	kcQ+Cuqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQypQ-00000005WKH-12cI;
	Wed, 11 Nov 2026 03:16:52 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQypK-00000005WER-2fI9;
	Wed, 11 Nov 2026 03:16:47 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 11 Nov
 2026 11:16:31 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 11 Nov 2026 11:16:31 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Wed, 11 Nov 2026 11:16:29 +0800
Subject: [PATCH v2 1/9] dt-bindings: i3c: Document generic bus timing
 properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261111-b4-i3c-hci-ast2700-v2-1-4d8fff5c5196@aspeedtech.com>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, "Ryan
 Chen" <ryan_chen@aspeedtech.com>
CC: <tbevis@amazon.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794366991; l=5440;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=8s/hr6LcKW3NUKIBczctmPCJ8HjrQqgS5f6q5QtjoUI=;
 b=FlOfxDc69OfnBYiNjbNnDOlB8QH4CyWBzrYFdBodKoQ84m9YOrKRgkHL6hjd00qQfHcB1ohwE
 H/lyP3vDKA9DFQyTelYKL3ZOHLkbahJCCDWoMq0Ki5fkRanbbLzjbZW
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_191646_740610_A0CB92F6 
X-CRM114-Status: GOOD (  10.02  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The push-pull and open-drain SCL periods, push-pull SDA output hold
time, and the tCAS/tCBP periods around START and STOP conditions are
normally derived from i3c-scl-hz, but board-level trace length,
pull-up strength and capacitive loading can require different values
than what that derivation produces for a given board.

Document properties to override each of these independently, naming
them after the MIPI I3C Basic Specification v1.1.1 timing parameters
they adjust:

 - i3c-pp-scl-high-period-ns, i3c-pp-scl-low-period-ns
   tHIGH, tLOW: Table 87 (I3C Push-Pull Timing Parameters)

 - i3c-od-scl-high-period-ns, i3c-od-scl-low-period-ns
   tHIGH, tLOW_OD: Table 86 (I3C Open Drain Timing Parameters)

 - i3c-pp-sda-hold-ns
   tHD_PP: Table 87 (I3C Push-Pull Timing Parameters)

 - i3c-cas-period-ns, i3c-cbp-period-ns
   tCAS, tCBP: Table 86, Figures 144/145 (I3C Open Drain Timing
   Parameters). These carry the protocol minima as constraints.

 - i3c-sr-p-scl-low-period-ns
   The SCL low period held while a Controller stalls the clock in
   the T-Bit phase before a STOP or repeated START, per Section
   5.1.2.5 "Controller Clock Stalling" (Figures 19 and 20). The
   specification describes this requirement qualitatively and does
   not assign it a dedicated timing symbol, unlike the other
   properties above.

Any property left out keeps the derived default.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 Documentation/devicetree/bindings/i3c/i3c.yaml | 86 ++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index 5603f2e7807d..30f65fd1afa7 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -57,6 +57,82 @@ properties:
 
       May not be supported by all controllers.
 
+  i3c-pp-scl-high-period-ns:
+    description: |
+      Push-pull SCL high period override, in nanoseconds (tHIGH, MIPI
+      I3C Basic Specification v1.1.1 Table 87). When undefined, the
+      value is derived from i3c-scl-hz.
+
+      May not be supported by all controllers.
+
+  i3c-pp-scl-low-period-ns:
+    description: |
+      Push-pull SCL low period override, in nanoseconds (tLOW, MIPI I3C
+      Basic Specification v1.1.1 Table 87). When undefined, the value is
+      derived from i3c-scl-hz.
+
+      May not be supported by all controllers.
+
+  i3c-od-scl-high-period-ns:
+    description: |
+      Open-drain SCL high period override, in nanoseconds (tHIGH, MIPI
+      I3C Basic Specification v1.1.1 Table 86). Open-drain timing is not
+      a function of i3c-scl-hz; when undefined, the controller uses its
+      own default.
+
+      May not be supported by all controllers.
+
+  i3c-od-scl-low-period-ns:
+    description: |
+      Open-drain SCL low period override, in nanoseconds (tLOW_OD, MIPI
+      I3C Basic Specification v1.1.1 Table 86). Open-drain timing is not
+      a function of i3c-scl-hz; when undefined, the controller uses its
+      own default.
+
+      May not be supported by all controllers.
+
+  i3c-pp-sda-hold-ns:
+    description: |
+      Push-pull SDA output hold time override relative to the SCL edge,
+      in nanoseconds (tHD_PP, MIPI I3C Basic Specification v1.1.1 Table
+      87). When undefined, the controller uses its own default.
+
+      May not be supported by all controllers.
+
+  i3c-cas-period-ns:
+    minimum: 39
+    description: |
+      Clock-after-start (tCAS) period override driven after a START
+      condition, in nanoseconds (MIPI I3C Basic Specification v1.1.1
+      Table 86, Figure 144). When absent it is derived from the SCL low
+      period of the applicable bus context, clamped to the protocol
+      minimum.
+
+      May not be supported by all controllers.
+
+  i3c-cbp-period-ns:
+    minimum: 20
+    description: |
+      Clock-before-stop (tCBP) period override driven before a STOP
+      condition, in nanoseconds (MIPI I3C Basic Specification v1.1.1
+      Table 86, Figure 145). When absent it is derived from the SCL low
+      period of the applicable bus context, clamped to the protocol
+      minimum.
+
+      May not be supported by all controllers.
+
+  i3c-sr-p-scl-low-period-ns:
+    description: |
+      SCL low period override used while extending (stalling) the clock
+      in the T-Bit phase before a STOP or repeated START condition, in
+      nanoseconds (MIPI I3C Basic Specification v1.1.1 Section 5.1.2.5
+      "Controller Clock Stalling", Figures 19 and 20; no dedicated
+      timing symbol is defined there). Kept separate from the push-pull
+      SCL low period to satisfy that requirement. When undefined, the
+      controller uses its own default.
+
+      May not be supported by all controllers.
+
   mctp-controller:
     type: boolean
     description: |
@@ -67,6 +143,16 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+dependencies:
+  i3c-pp-scl-high-period-ns:
+    - i3c-pp-scl-low-period-ns
+  i3c-pp-scl-low-period-ns:
+    - i3c-pp-scl-high-period-ns
+  i3c-od-scl-high-period-ns:
+    - i3c-od-scl-low-period-ns
+  i3c-od-scl-low-period-ns:
+    - i3c-od-scl-high-period-ns
+
 patternProperties:
   "@[0-9a-f]+$":
     type: object

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
