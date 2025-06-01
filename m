Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A9FC54FB3
	for <linux-i3c@archiver.kernel.org>; Sun,  1 Jun 2025 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0C+6kewy7by2hGGmZjnKKJnGWmy5jntF8rDRjjx+GOY=; b=QasdCkDBoL1zUI
	oWhTA43dOJ7U+GkGZMKWrVlWMcgiMr3Y+ZvvDZYd6ReaEQdnYX0LABow5hbXKtQZSRYlg/WEMmny7
	aAiysUl396RR2BAtSakN2JSw8Bm13k6KxbsJrKE/KjyhGN4R762ct+urQKjAki+DQ9aVUTTIT4l7e
	iVmdMLD88cvK190mCuhCREVcYdBOE0+ohSZLAJIua+ldn71l84lhwuURkoBS7ERXrwt90cV/23j4o
	Y6qQskGoJff/m33O5GRAdUyrYWI71Dqp6kN8aaF63yu1wI0/j62+sm/L6IMRgbNJuW7qlEFYc5d4T
	WuQoG6WxuGgT5jlyr9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLes3-000000055PU-35at;
	Sun, 01 Jun 2025 09:20:47 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLes0-000000055Oe-2OPm
	for linux-i3c@lists.infradead.org;
	Sun, 01 Jun 2025 09:20:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A05B441CFB;
	Sun,  1 Jun 2025 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748769639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=SG79vLzOV4NvBFmDiztTAzYiWAj60flBXkGh8eD/hO0=;
	b=lv16smVT/71yEyiugIQd530TMj+K0O68k7wwOcJud+LAHk4NJiaBlF+0Dr0ykzB5xIwoHA
	1owzn5pe47i5uAVPbwi4i/AsD6oEY/nvPRXq0F4kvDUQ0gNwa8Ile749/P463hXUhjKqyK
	PFpxQvZU36uJ/Zw5qlLgPFcOrfs1QAw9jutB3aKGOHVu6DRGBswmUVMRZpzOaePpd9CpcA
	3Br8wnraxH2tyZVCBhq1zcsRNmkOrjVPTOLEkqvfwVuzbGhXKyOrUkL0WkANtftXfEMzw5
	+eToKas7k6oMHPELxGODD+AKzEO437uxtUJGYcrAQQfYQWNgtMPDsk+s4QJPZg==
Date: Sun, 1 Jun 2025 11:20:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.16
Message-ID: <20250601092038f33de29e@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefgeegtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkgggtugesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhgeefhfdthefggfektdefleekudeggfdtueeggeffvdekfeejhfekhffftedvkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqiheft
 geslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_022045_370193_37F6F458 
X-CRM114-Status: UNSURE (   6.67  )
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

Hello Linus,

Here is the i3c subsystem pull request for 6.16. There is not much this this,
mostly fixes around interrupt and IBI handling.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.16

for you to fetch changes up to 00286d7d643d3c98e48d9cc3a9f471b37154f462:

  i3c: controllers do not need to depend on I3C (2025-05-24 22:49:07 +0200)

----------------------------------------------------------------
I3C for 6.16

Drivers:
 - mipi-i3c-hci: interrupt handling fixes
 - svc: i.MX94 and i.MX95 support, IBI handling fixes

----------------------------------------------------------------
Carlos Song (2):
      dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and i.MX95 I3C
      i3c: master: svc: switch to bulk clk API for flexible clock support

Frank Li (1):
      i3c: master: svc: skip address resend on repeat START

Jarkko Nikula (5):
      i3c: mipi-i3c-hci: Allow only relevant INTR_STATUS bit updates
      i3c: mipi-i3c-hci: Fix handling status of i3c_hci_irq_handler()
      i3c: mipi-i3c-hci: Clear INTR_STATUS unconditionally
      i3c: mipi-i3c-hci: Change name of INTR_STATUS bit 11
      i3c: mipi-i3c-hci: Move unexpected INTR_STATUS print before IO handler

Stanley Chu (2):
      i3c: master: svc: Receive IBI requests in interrupt context
      i3c: master: svc: Emit STOP asap in the IBI transaction

Wolfram Sang (1):
      i3c: controllers do not need to depend on I3C

 .../bindings/i3c/silvaco,i3c-master.yaml           |  45 +++++++--
 drivers/i3c/master/Kconfig                         |   4 -
 drivers/i3c/master/mipi-i3c-hci/core.c             |  32 +++---
 drivers/i3c/master/svc-i3c-master.c                | 109 ++++++++-------------
 4 files changed, 98 insertions(+), 92 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
