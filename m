Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318FBC83F22
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Jul 2025 13:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HqLu9XrCeky3+pv5mGLDPSY2M+YK1qovGZgkx/GQNgg=; b=Q+qGN++hg/3PGi
	AX3wxvGCl21Xx8xO2rRPgbS/e4aM8CZofuqAn79j+g8eQj/vMlNPTbVHLhozHJ4z7sgvjNIFAcOkT
	jeLDne0A191wQp/L0Lxhn86SYF67q5v8LUWJQHb1O3X3cagsW+QTFU+2CM3w9cUphfztZSJpw12fE
	6AY5a55zPj7ct/J5z8ZI625yF9VPdePWjHHRWyXgVQU7OSq1fEt/ByHidGE5ZjW3//c0JyGJq/tkA
	M/xWfdqc6hMRq6RwzUKYUzDUlCTgvKX2SkSOSyGb6MP9ZvlXLsd7li7rEGLgUZEsBpf0P59VDoyTm
	U+Ctmx/EfdoMYI1qZ26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOl0-0000000AGsS-3i0c;
	Thu, 17 Jul 2025 13:34:42 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNfm-0000000A6m4-2ob1
	for linux-i3c@lists.infradead.org;
	Thu, 17 Jul 2025 12:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=bNx8gllGSe/xy2
	vLhCn0cAXNpGel+OqdtdLDQBiWdoQ=; b=EAl0qA9mbot7pso+VTslj4rNQBSt56
	66eiK2vjlv0+lnmxGqkjxz5RT6YfksGS12ls5HmBACf2IlO7i2YD6zi6qixXSJ7t
	/JMMvGMjzuFdMNN43pYrPNWnzFajR5o9u2su7oWMatEPIyCHpCX0hy8X2J+8DCYk
	xXox0gCwEoIBjIV5B0Pps6cIXu3kiFzw1I/+ivaxd75Wto9Lt/eMsQws89o6pDGH
	f8dtBk+Xza8Gv2MCb/U6k3EV7Vf3VCcOl7uGdLYduE3QPJToTBLm8q8nbvwgLtZ0
	iZFo9WNPXlnY74dwRs56GJgFPQKFJuDuM7aCZQ3BGcdaUUipo2dz/9JA==
Received: (qmail 3671446 invoked from network); 17 Jul 2025 14:25:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jul 2025 14:25:12 +0200
X-UD-Smtp-Session: l3s3148p1@HWbYGR86GMcgAwDPXx+vAAkEB0lWxGP4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v2 0/2] i3c: add support for the Renesas controller
Date: Thu, 17 Jul 2025 14:24:51 +0200
Message-ID: <20250717122455.9521-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_052514_983221_146A1E29 
X-CRM114-Status: GOOD (  11.32  )
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

Here is a basic driver for the I3C IP found in various Renesas SoCs like
RZ/G3S and G3E. Missing features to be added incrementally are IBI,
HotJoin and maybe target support. Other than that, this driver has been
tested with I3C pure busses (2 targets) and mixed busses (2 I3C +
various I2C targets). DAA and reading/writing to the temperature sensors
worked reliably at different speeds. Scoping the bus, the output from
the protocol analyzer seems reasonable, too. It was created by merging
two versions of it from two different BSPs. Then, improved according to
code analyzers, cleaned up with regard to coding style, and then
refactored to hopefully match I3C subsystem standards.

Changes since v1 are described in the individual patches. A branch with
enablement patches for RZ/G3S+G3E can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c

Looking forward to comments,

   Wolfram


Tommaso Merciai (1):
  dt-bindings: i3c: renesas,i3c: Add binding for Renesas I3C controller

Wolfram Sang (1):
  i3c: master: Add basic driver for the Renesas I3C controller

 .../devicetree/bindings/i3c/renesas,i3c.yaml  |  179 +++
 MAINTAINERS                                   |    7 +
 drivers/i3c/master/Kconfig                    |   10 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/renesas-i3c.c              | 1425 +++++++++++++++++
 5 files changed, 1622 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
 create mode 100644 drivers/i3c/master/renesas-i3c.c

-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
