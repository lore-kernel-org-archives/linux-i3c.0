Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794E3C83F1A
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Jul 2025 09:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T2BUejk8uWgkzguKYIPe5Bj62WgmMnxan5ZZ1jjjbLk=; b=PKug02dovk9fFr
	9VWhI0TAZr3GP7o5Da3N1/VfH4qVIkeU9aWna+jTcbVR7HY2i3HTBKlc784Rz0LPni4ND/NDVG/Gs
	mEE8bJb+uEpcj1YLcYWmMfDI8+TINO7Pt54ImNWOwLHOiGD7SbJzDHk2cH/l+myQxgg+JPBnAgimz
	5Guiezk1rJ+Ib3Vy1/qVwvviSFk/fZ7FPsVN0uLcyCFCs4xPdc6b8/AyVbeztdTfmHZoV3PftRwIl
	nob/oDGZHHlADGEmVdJwkb/lNYVMiJuT6pU2tlluC44VDmtxs4BkGLaB5GfzGxkGTIyEbO3Ri+fj5
	FhTkv0BZ71h/hXduko2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFG3-00000001kAA-0w37;
	Mon, 14 Jul 2025 09:13:59 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFEb-00000001jp9-2d6d
	for linux-i3c@lists.infradead.org;
	Mon, 14 Jul 2025 09:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=xC3Ooo/eMtEmsx
	oVMthubZ43cLSq+KXHCw/RPK4BkGs=; b=TnBs9jQdA1955Sah4dgnBsHA/shzIg
	cjbHUUtug3K2d3RgdfPVib39hLBbArzd8JPnhonz710BHmzRBYlbDosRv/ciaI1D
	R8/2ZxmwOQKs/9P3hTX6Gw01AAXBM9iFHnl5psJcd7CfW4PstCwek8p+2OM+Ooky
	rzGRn3KFLW9Oaafowb8SSfCQtk+txVELGiQfqXfPSQ/jA1p7S5pKdm1cAqh/CmlB
	GNX3CWV2AUiBCQRhkYgjQOyZ1z0hfKSxX18LR32NgAqZN8yb4bR8Nv6WGSEVLiTW
	q6y3ljw+ZrSxHnNWKLkQ22wUNdgS/9KAg+s8wxWD4MN4ipq7dtkyAdAg==
Received: (qmail 2399766 invoked from network); 14 Jul 2025 11:12:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jul 2025 11:12:23 +0200
X-UD-Smtp-Session: l3s3148p1@qVPBDuA5dOYgAwDPXxNjAMIr4MhSGEU6
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
Subject: [PATCH 0/2] i3c: add support for the Renesas controller
Date: Mon, 14 Jul 2025 11:12:07 +0200
Message-ID: <20250714091211.20497-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_021230_545429_E05434DA 
X-CRM114-Status: GOOD (  11.91  )
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

Changes since RFC are described in the individual patches. A branch with
enablement patches for RZ/G3S+G3E can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c

Looking forward to comments,

   Wolfram


Tommaso Merciai (1):
  dt-bindings: i3c: renesas,i3c: Add binding for Renesas I3C controller

Wolfram Sang (1):
  i3c: add driver for Renesas I3C controller

 .../devicetree/bindings/i3c/renesas,i3c.yaml  |  180 +++
 MAINTAINERS                                   |    7 +
 drivers/i3c/master/Kconfig                    |   10 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/renesas-i3c.c              | 1433 +++++++++++++++++
 5 files changed, 1631 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
 create mode 100644 drivers/i3c/master/renesas-i3c.c

-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
