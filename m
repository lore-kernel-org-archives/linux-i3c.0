Return-Path: <SRS0=eOHn=JE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9143C433ED
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Apr 2021 08:21:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF705613A7
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Apr 2021 08:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF705613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CmM2dL2ocazTCm+QRYvOUZfyTM2T/fOrBmKovs1pSf0=; b=I6IoHHYO38+BfdFo6w9mUK04b
	BA5lrR9Q+Gc6qiZohXxbIcwDU1DaBzs4K7kLEi5cQacI3NtroFY4DjKYVzPIQyqESqnIlIiSGyJTX
	WFqXT0AKZqmb98jN7IviJE+9FO1FJOIwXVPTrRJMzvH/fclm62qdq47G/YVsq4XTBWajE+bzaa6mp
	D6D4bxQMqqu8EgHySn2m3Zon5kyikjbL5nYKrGJpmPcak0AmcMXSTUKPbRC+wV1tvrw+uS4gVkGLT
	ZUUdeGvLZ6cK3syrESo3zay7XMdUkniw8tUTZE7klBC0G068KWBCGGWDZXEGbEQv9mTA1lYcvjNZB
	ooAKGf/nA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU3Qz-004SzW-RL; Wed, 07 Apr 2021 08:21:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU3Qw-004Sxj-5K
 for linux-i3c@lists.infradead.org; Wed, 07 Apr 2021 08:21:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7741A613CD;
 Wed,  7 Apr 2021 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617783662;
 bh=FN9fIYc0xtc0WoRKgICBUgYOcktenG0goqi4S9V1/qQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZzpyYrPtPrUdIqRancpV4Zj8Q/SAAt5LA1ZhWdWuoPFzFtm/Bz1lvZ9ySsAJ5jGAX
 cdgVHgP+pdiBRiBIbZrJpbM7GcLFREp9+bSPAfytUMofNCSKTRynu7TiQ3Tj9hDccG
 vwmsYekf7tGJsXAKP66+kMnTzWZD4d/WL5Yf+MGKja2LSm0Xzfqg2wa/RosyTiokie
 eadV3spDUMNVvZe5rUHVMsVqPv/rKhPptjI0LhW/raUqqqP6Hy1ZErJst25Nkmyg1R
 XAtxkpFPRlFNeaAlW5PuXYYR6WM2ppkRvv0AQhyI3VMiK9pqjsoSFxTmYs+JKmP/D5
 CKojS5FdMuhPg==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lU3Qq-005i2Q-IA; Wed, 07 Apr 2021 10:21:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>,
 =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Vitor Soares <vitor.soares@synopsys.com>,
 devicetree@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 09/19] dt-bindings: i3c: update i3c.yaml references
Date: Wed,  7 Apr 2021 10:20:48 +0200
Message-Id: <8bb8923b4d98b4e8a6336a4c0b548c714e01aef5.1617783062.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617783062.git.mchehab+huawei@kernel.org>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_092106_646235_C0F10199 
X-CRM114-Status: GOOD (  10.15  )
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

Changeset 5e4cdca887fd ("dt-bindings: i3c: Convert the bus description to yaml")
renamed: Documentation/devicetree/bindings/i3c/i3c.txt
to: Documentation/devicetree/bindings/i3c/i3c.yaml.

Update the cross-references accordingly.

Fixes: 5e4cdca887fd ("dt-bindings: i3c: Convert the bus description to yaml")
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt   | 6 +++---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.txt          | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
index 1cf6182f888c..3716589d6999 100644
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
@@ -10,19 +10,19 @@ Required properties:
 - reg: I3C master registers
 
 Mandatory properties defined by the generic binding (see
-Documentation/devicetree/bindings/i3c/i3c.txt for more details):
+Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
 
 - #address-cells: shall be set to 1
 - #size-cells: shall be set to 0
 
 Optional properties defined by the generic binding (see
-Documentation/devicetree/bindings/i3c/i3c.txt for more details):
+Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
 
 - i2c-scl-hz
 - i3c-scl-hz
 
 I3C device connected on the bus follow the generic description (see
-Documentation/devicetree/bindings/i3c/i3c.txt for more details).
+Documentation/devicetree/bindings/i3c/i3c.yaml for more details).
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
index 5020eb71eb8d..07f35f36085d 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
@@ -9,19 +9,19 @@ Required properties:
 - reg: Offset and length of I3C master registers
 
 Mandatory properties defined by the generic binding (see
-Documentation/devicetree/bindings/i3c/i3c.txt for more details):
+Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
 
 - #address-cells: shall be set to 3
 - #size-cells: shall be set to 0
 
 Optional properties defined by the generic binding (see
-Documentation/devicetree/bindings/i3c/i3c.txt for more details):
+Documentation/devicetree/bindings/i3c/i3c.yaml for more details):
 
 - i2c-scl-hz
 - i3c-scl-hz
 
 I3C device connected on the bus follow the generic description (see
-Documentation/devicetree/bindings/i3c/i3c.txt for more details).
+Documentation/devicetree/bindings/i3c/i3c.yaml for more details).
 
 Example:
 
-- 
2.30.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
