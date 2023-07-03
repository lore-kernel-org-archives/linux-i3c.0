Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61315EB64DC
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jul 2023 05:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YHRMeFyVNp9r2g2Cq0Yw7qqcH+fgjd6xeCJ2j2H+kdQ=; b=emoKUmE573HdB0
	ejAqBh0WT8TaVeeq7SE6x08Nn07bh4uWxY1B0ZQHsreIyZSn0HjevPrXyWtT9nJ9CEIsjEtDB00i+
	CcIyT2nCut65U8m4wwD6RpyBB57xTTJ+DJsvYe4OKKkaLKmsgr0nC9oGwemkBKXsLBSYxFTsG+vTc
	Dnt+7AwrYSvF6CHGGwaAbnQtSAWodK5XGQ5UXDBUZXooqHGszzPRzbUERTKufyuLExOJsHCz0Jcdn
	1RGZi3xLi3OZDUSYFrnbqrlImjEictNMcnc5cbo9gVAyrh/yLEY/UzWclC25g1h8egoKFv7x5MmXq
	yLVqT16tpAehf0gYOA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGCAI-009LPW-2B;
	Mon, 03 Jul 2023 05:31:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGCAE-009LMl-04
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jul 2023 05:31:55 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id 73FDE202AC; Mon,  3 Jul 2023 13:31:44 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1688362304;
	bh=KPlTtwQXzcm8osPuB08R4KJIMh3H7wCTHPv/bCpkWrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RQr8r/g0Ni4ZCux/QoLJqjSOi4yFumwmImF7mp7JICFy+Hhn7zG+ILW8xpDkFq/Yi
	 c6pzwTSTWKTyjW7tkSxqFowLWfgepz8QA2Xfo2MUvuN1J0kzqMd8R4mtO09u31uDZG
	 dejRX5UntuHSuCswyJ0lCv20n1kF0Rn17SchcQEQqx0jbx1KAbls3oxrWxHg9p0bVM
	 kY4oFDU8pLU44k7jHjLA+uJ2FyCCO1/yXSCp/+tQf9yTSXVpZrRndV0FtknrlQkLfc
	 CS91xUw85CQm0p7K+7qVLQw6f/TDeopvd1bt/v1yRRLIBE1QGD79LcTcuZw7umJu+Z
	 9AEPNINOU74GA==
From: Matt Johnston <matt@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/3] dt-bindings: i3c: Add mctp-controller property
Date: Mon,  3 Jul 2023 13:30:46 +0800
Message-Id: <20230703053048.275709-2-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230703053048.275709-1-matt@codeconstruct.com.au>
References: <20230703053048.275709-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_223154_262147_EE27DE83 
X-CRM114-Status: UNSURE (   8.00  )
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

This property is used to describe a I3C bus with attached MCTP I3C
target devices.

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/i3c/i3c.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
index fdb4212149e7..08731e2484f2 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
@@ -55,6 +55,10 @@ properties:
 
       May not be supported by all controllers.
 
+  mctp-controller:
+    description: |
+      Indicates that this bus hosts MCTP-over-I3C target devices.
+
 required:
   - "#address-cells"
   - "#size-cells"
-- 
2.37.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
