Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2532C83F1A
	for <linux-i3c@archiver.kernel.org>; Thu, 24 Jul 2025 10:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EEG8qNoe8Yc690LSGhAvflaYopOYMQn996dCJtkWmBQ=; b=aCmXvS9nCDDmG/
	iGUPWKrugKj7T6Nuxgj958GIu8rEcpN+zW2LctlW9PQ9bMqA3PhX0i9tIHA59KYlUdBZW7Dz+vjem
	j8WjHrbYV50nxucSeADFt+xljG9Hfr6UdeVCOEDfd0yoQPgwevG9QJyEI+upSOvNskOfScmAMa9Cp
	hcvVtEhiwT3RV04clQOhNKx12Pur/5AvqgFWkkEAg2hO5zUWstAnPu/Z+KusZ3cVD3Ujo2NGr5W8w
	itviTBik4RzgjKkOcDhP30LKab4Ar6g/SfEPAxbRxx/Hoqt1pZxMWIEEDEU1fWSCFVhj4aMcSk+dI
	ocSM2+BeYEKjprhKSQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetct-00000007Gtt-1S3h;
	Thu, 24 Jul 2025 10:56:39 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesST-0000000750C-40BY
	for linux-i3c@lists.infradead.org;
	Thu, 24 Jul 2025 09:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=pqi6scVX8AxwJ8
	OR0QjkdOlPSeaMekWpfnI+8ituDOQ=; b=FcFcYXyz+oSuSl7RCQoDG57hHaGUYg
	OdAFHD2SC8yRPUqKsSs59297kZclfyitAIPFeU5rf1p4VsWpx1lWHahTggUHD0Tt
	V2W6uBuE2Qbktc3Adpdqm/K+9tD4AZaKQtqN7sURXuYmLFufAmPW9oBStVTZt0oN
	JjN4BpV5bdyu7O1cMMYVdAwLCpW8wj6rwDWOOHoigabDNWcATGGQaeMo7nLlJEP+
	yW2auhgP6IJYBXafNU06rwfzEP7ZEJI2SW4UnQiSQeBU28ZEi/tsjvCto6dP7nVC
	uOvOJ6yOvqHYVowd/JEOS5tHX9opZ8tgbNV6CRyQFxCO/whouXXOpWdw==
Received: (qmail 2016439 invoked from network); 24 Jul 2025 11:41:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2025 11:41:47 +0200
X-UD-Smtp-Session: l3s3148p1@I7ZOoqk6tNEgAwDPXyBWAATEinPyanBm
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
Subject: [PATCH v5 0/4] i3c: add support for the Renesas controller
Date: Thu, 24 Jul 2025 11:41:39 +0200
Message-ID: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_024150_266789_1EFCE108 
X-CRM114-Status: GOOD (  13.16  )
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

Detailed changes since v4 are described in the individual patches. A
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
 include/linux/i3c/master.h                    |   13 +-
 8 files changed, 1618 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
 create mode 100644 drivers/i3c/master/renesas-i3c.c

-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
