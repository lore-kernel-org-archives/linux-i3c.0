Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EA0C7113C
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HTByCjVYPefJZpr6iTO45AB5IZVxblnm0X62DqfOvnk=; b=4TInAs0yJZ5AM2
	XdYdoTZBmwrsysZ0LkksswydcR7ILbFZmYecmW0uEYYMGuFLPraMhXBLmMRylSI1Y0KcclAvn4iq+
	NF3hQFepXekE5k3nS82dMYwqqDs8YN0FWrkYgK2KkXR1HwA5EJEbzCdruDKUnv4vO/H8n7/ChiIeM
	ybHmp7t84XhfLFpEkdjpHez55FUPah23QpHsfpi4noHIpbv6FM3GQkN/cqtHeIA6ezPk8Pl5X7ExO
	7eRfng671Ynu8BdiXjAUxrpeYEOD/WFtoXAUCe/wcxb45N4Aet8v8GhRluRI59rJnL3Spi1njUvZz
	jRUvYiE+xfFMCD2XQz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMl6-0000000A9u8-2xKe;
	Wed, 11 Jun 2025 14:48:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHwE-00000009VF4-3P0y
	for linux-i3c@bombadil.infradead.org;
	Wed, 11 Jun 2025 09:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zH0VzyGLR/mOkiAFq6apyRlsnaQD4TKPWwgqIVI/8Ew=; b=j3I+Es4TosJ+fr2kxokf31dquD
	aOv1cG9cCOvJhO/K2IvjylEPSFWNrawg5g3Cwn3GoMaoCLwVGXlpvbnlplQl3K5G/u4PkpII+eRMo
	e8o1qfMAo25A7uwqQRxGFBFmg1yI6/vEbTsD4HbwcN2Fv8sfenmenyBwamWQlaJ+9vov6+crIpJU5
	y3cbQWXo94vBf4JbdGyjfwZWzEAGzzmJxShVzR9i/U9q473deWzdanXumoHd6Fa8U482rjjnB/OP1
	ZRAbWJSWyyQ9OqDmCwAfP9MQ6J3fXJmL7Nqvsv66dmDi7riMxiNb6CMS0VH66rNblObiKGt/ryLww
	3JsBkwVg==;
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHwC-00000002Ewc-1snn
	for linux-i3c@lists.infradead.org;
	Wed, 11 Jun 2025 09:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=zH0VzyGLR/mOki
	AFq6apyRlsnaQD4TKPWwgqIVI/8Ew=; b=VFNVNpSbvQWU5HJ5S3bJmFMYPyssop
	9Kdmvnr0gWqtRkWE0lq0z8lz4U+TJr8pKSwhd1DpHFsWj9/g+NDUEBLscwAOILa/
	eOxecLtRZS+aThdI32f0HEJsqfBjJyY1YrGtHZURtQNkDl5zlT4PGsISf6a8MMAr
	0PolMggQk72ZK3oopSOZ+WiQ4Ovgl1jVXITUU/4rJQN3nZOcwXvYfwKTjXuIASNz
	a/GmQyd0+WTSagKcidSAAs7fsFEnEvxKJzQ9U7xWEwXCuZ5ac8ZVLzcq4hjFfLzW
	2+m1XlN5fs8ITMH/W8yMyfZlNZKufKfcExK9abUMZ1/G9DvM1hyEDGYQ==
Received: (qmail 3186264 invoked from network); 11 Jun 2025 11:39:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 11:39:48 +0200
X-UD-Smtp-Session: l3s3148p1@EIQHmEg33rAgAwDPXy2/ACpZfVCNKldR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH RFC 0/7] i3c: add driver for the Renesas IP and support RZ/G3S+G3E
Date: Wed, 11 Jun 2025 11:39:24 +0200
Message-ID: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_104005_025837_B8DD8601 
X-CRM114-Status: GOOD (  18.64  )
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

Here is finally the first RFC of a driver for the Renesas I3C IP. It was
created by merging two versions of it from two different BSPs. Then,
improved according to code analyzers, cleaned up with regard to coding
style, and then refactored to hopefully match I3C subsystem standards.

It is a basic driver for the I3C IP found in various SoCs like RZ/G3S
and G3E. Missing features to be added incrementally are IBI, HotJoin and
maybe target support. Other than that, this driver has been tested with
I3C pure busses (2 targets) and mixed busses (2 I3C + various I2C
targets). DAA and reading/writing to the temperature sensors worked
reliably at different speeds. Scoping the bus, the output from the
protocol analyzer seems reasonable, too. But hey, I am still new to all
this, so I might have overlooked something.

The first patches are needed to enable I3C on the RZ/G3S and G3E boards.
Once this series loses RFC status, they will be sent out individually,
of course. All is on top of 6.16-rc1. A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c

Why is this still RFC?

- On G3E (but not G3S), we get a spurious irq during boot. We are
  working on it. This is just platform dependent, though, kind of
  independent of the high level design of the driver. For this, we
  would love to get comments already. So, we can fix things in parallel

- G3S has 17 irqs, G3E only 16. The way we handle this might need
  discussion (see patch 3)

- On G3S, clocks are named 'i3c' while on G3E they are named 'i3c0'
  I don't have all the needed docs for this, but Tommaso can surely
  figure this out meanwhile

- There are some open questions regarding the driver itself
  (see patch 4)

Really looking forward to comments! This has been quite a ride. Getting
a suitable test setup was a surprisingly big task. If someone knows an
off-the-shelf device supporting HotJoin, I am all ears. I couldn't find
one.

So much for now here, some patches have more details.

All the best,

   Wolfram


Quynh Nguyen (1):
  arm64: dts: renesas: r9a08g045: Add I3C node

Tommaso Merciai (3):
  clk: renesas: r9a09g047: Add I3C0 clocks and resets
  dt-bindings: i3c: renesas,i3c: Add binding for Renesas I3C controller
  arm64: dts: renesas: r9a09g047: Add I3C node

Wolfram Sang (3):
  clk: renesas: r9a08g045: Add I3C clocks, resets and power domain
  i3c: add driver for Renesas I3C IP
  WIP: arm64: dts: renesas: rzg3s-smarc-som: Enable I3C

 .../devicetree/bindings/i3c/renesas,i3c.yaml  |  186 +++
 MAINTAINERS                                   |    7 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |   35 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |   35 +
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   33 +
 drivers/clk/renesas/r9a08g045-cpg.c           |    7 +
 drivers/clk/renesas/r9a09g047-cpg.c           |    8 +
 drivers/i3c/master/Kconfig                    |   10 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/renesas-i3c.c              | 1441 +++++++++++++++++
 10 files changed, 1763 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
 create mode 100644 drivers/i3c/master/renesas-i3c.c

-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
