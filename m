Return-Path: <SRS0=/LVT=I6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C840C433ED
	for <linux-i3c@archiver.kernel.org>; Thu,  1 Apr 2021 12:18:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 892796112D
	for <linux-i3c@archiver.kernel.org>; Thu,  1 Apr 2021 12:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 892796112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NJtQ2PBtQVETY6+6fR1Pl99VdGpIS8ZAhP8c4HlYoqo=; b=TComCHZs49eHuiisHd4yEXngZ
	04aCoZrs7CeDPcyAwVKNR9eorLOjRQHXJz6qX8updbwJmasRqcJ0uQa6M5RH0ru3Cp7p2eIz5xNfK
	Q+50OMV89KgQtu3XEcoC0cr8CNlo9U30e4cpX/Qx+BT0KwMfX3xTJ3eYzqB4R3KQxibP07YmG8qpC
	tjHjTw+lVPj5GCGSiTw8fPzrKZCzTCUJXOHYGqO1ZTU306OcVluNN18QBLtXN5omKgZySdqybVxuT
	7aR2j3wPrNfuIX6uL9DnQBbGZ4TR+O2seOUUcbLPIBtR+6G1REkO52C28KCJh5psF9yltwyix3qU+
	GTvsfYy+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRwH5-009ZDD-Sv; Thu, 01 Apr 2021 12:18:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRwGu-009ZAe-1m
 for linux-i3c@lists.infradead.org; Thu, 01 Apr 2021 12:18:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 726AC611CA;
 Thu,  1 Apr 2021 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617279476;
 bh=BnEWnVkqMrbAWG8jRB7Ad1C4L7HMZywQ6hzq4TbT8UM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LPnQs3u0SA4q5hbHfq4RzSQs+FvcWBNcfhCTKN6bcNlYj9sKG8msZVimUxSaFruSC
 8f1cqbBCUwjkAGluou0uqBj+uvjPB8fqBsalkQmfIuD+D3wwo5qv8hiqVsQ59y9VCe
 kbXqitfXDA+PXFQ7KGEcMYafOmZA6tKtx8Ill50H7BtHyJLojLog+YntFnsrwsTSa9
 bT5TlGv2GcTzHNPMD7kXNU4DfRmzv7R5HmIeqHBXovFPOROhDgi4oEYGohT0HzVJtu
 qflkxbJCbDg+Xx/5q6vRLu1FjoQlsj3yct872Nt8rh29A1TOt+ToVBfFbGzycP4PiK
 hnOfig097Jhdg==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lRwGo-001c3a-HY; Thu, 01 Apr 2021 14:17:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>,
 =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Vitor Soares <vitor.soares@synopsys.com>,
 devicetree@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 27/32] dt-bindings: i3c: update i3c.yaml references
Date: Thu,  1 Apr 2021 14:17:47 +0200
Message-Id: <22b7b53af1907f7cae27e26be725470c04b84725.1617279356.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_131800_393882_8EA72F57 
X-CRM114-Status: GOOD (  10.34  )
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
