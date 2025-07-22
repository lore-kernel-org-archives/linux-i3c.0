Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30FAC83F27
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jul 2025 19:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2PdR/Iy5xhL/R1tPazBg7zxwB9JtoBRAG9ezxIJT9Pk=; b=W/GpuhT89XRpZ7
	9wl5V2P2mY+Fe2PjDNv+a7/ldb2E5DARqSypZoP0sbgupb8Taj5ZwVPBO80+qBIrO4Vb4Imwszx1l
	vNHXbsvF1/+ng0StKlSPwXnEUgOUCGqMcYa4kKPdI/iVASN1A7TesBFJtaB0NKdRCNerbbEDTj/6b
	Tx/MenHypRTMPIaHeQaVVFHSpZToIO/SVaSqralhg0gLpJjlMcs4IxXq7OTqD5U1TSFZvMPzGFJR8
	SMD2vk/DjU9eckY9XvzBPmCSZXFFB3hNc2uWdNzHt3G1qIkvisEGN/jh1qMKih9KdbEL2PRU/u6mc
	x3NRoWssVhiAGxkbbk4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueILG-00000003JeY-2ExP;
	Tue, 22 Jul 2025 19:07:58 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueILC-00000003Jdw-3IEE
	for linux-i3c@lists.infradead.org;
	Tue, 22 Jul 2025 19:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=jhmRhKQ3uBZR68
	PwHbt4FpVH5/DxMJnUwPll1eKv7Y8=; b=WSlFLoSfU+OnStkzR/wf3n+JJ4HIjB
	zLLvVV8fWJtPJGhfNlDc6yWTA0gq02zvbx/cQ/e74rI9NIQfZqyMq4iTNux0vYt9
	gllk+IlkydiRC8QtytqLL4uUyW2N+4ezg4a7wHpYGvA0FyIuQplqFrQX0v54KeeJ
	uBL22QfhKBIFQlT+eAFGgEBRHs+iFxbh0HyRAKvRUdAxB71EyTzghgIxG6M0K8TW
	OqG8ZRaWAEyFF8fRjXTt4tP3Upixzbsl3cxQHJy7xXZfFxkbBJxCktphr/fBp1+Y
	vwyBMY3yo5eTaggfk35DbZamVXnnNTwDpkIQkshaivf+Z/KETz5zP7OQ==
Received: (qmail 1426940 invoked from network); 22 Jul 2025 21:07:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 21:07:51 +0200
X-UD-Smtp-Session: l3s3148p1@Pt0MT4k6QIggAwDPXyBWAATEinPyanBm
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
Subject: [PATCH v4 0/4] i3c: add support for the Renesas controller
Date: Tue, 22 Jul 2025 21:07:42 +0200
Message-ID: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_120755_694119_3F35364B 
X-CRM114-Status: GOOD (  12.48  )
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

Detailed changes since v3 are described in the individual patches. A
branch with enablement patches for RZ/G3S+G3E can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c

Old coverletter:

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

Looking forward to comments,

   Wolfram


Tommaso Merciai (1):
  dt-bindings: i3c: Add Renesas I3C controller

Wolfram Sang (3):
  i3c: Standardize defines for specification parameters
  i3c: Add more parameters for controllers to the header
  i3c: master: Add basic driver for the Renesas I3C controller

 .../devicetree/bindings/i3c/renesas,i3c.yaml  |  179 +++
 MAINTAINERS                                   |    7 +
 drivers/i3c/master.c                          |   12 +-
 drivers/i3c/master/Kconfig                    |   10 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/dw-i3c-master.c            |    4 +-
 drivers/i3c/master/renesas-i3c.c              | 1404 +++++++++++++++++
 include/linux/i3c/master.h                    |   16 +-
 8 files changed, 1621 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
 create mode 100644 drivers/i3c/master/renesas-i3c.c

-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
