Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0350AC54E60
	for <linux-i3c@archiver.kernel.org>; Sun, 17 Mar 2024 23:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pnPSTZt+Nj6lch1eikhENMRqILS1p24Ei2D4hF+E0lI=; b=PjdSnJwCtwqiO1
	fSwVesQpH3Roivx+PXwUWD9fPHCPA8Gpba4M4n5iBgu5WuI45HH1b7ve8sAEy2NEDFMcJBZM3F5xd
	USqWLQ8RI23bSTHR0X5i8vlb4pCR+gYcnyRkFvZp27wEQW6R4Myjk4gmEYzjijkQ8JxZc1u/zHnsj
	9TF5B05z4dmYtXe3eQpOpAXJHNrJILWb5RfzxSgbwgB6d5PbJDlP9a5cwwxE72pAdYWsGJtaBAS84
	R6Tx7gPVU+5yKKEc+j55J4H3/05MeeS8qq/Vuq0Dvkz0Or9C9bHgQkyk/9VCs7Hv5j/lnB8Hkmt+A
	moqbai+4zGptoT7+xunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlzxT-00000006kUN-0vfZ;
	Sun, 17 Mar 2024 23:30:27 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlzxP-00000006kTs-2zYw
	for linux-i3c@lists.infradead.org;
	Sun, 17 Mar 2024 23:30:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFFDF20007;
	Sun, 17 Mar 2024 23:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710718219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=qUhKoh9x7/zlcPWHn7hoEfdM/jkA+eVywgtcxwW2dlw=;
	b=DWIo2AnZrKGlhAx/y4JpoVgijRc6hTTwiMg1TY/Pb1p/wT9ODoufJwNBW7rqwzuQzbADiD
	ycSSlX3nd8RAlVx2/ExQBR0nCx6iCBMG4VqXIH3khjtA/z5J5UcHJdD1i/pOnBzMDwafBN
	dhTFnwfKavzS+3wR27p5Q/UpBZ4oHYmjyEq6fjAF71j923k+4iFjd70jFeOpA0lYet5gUZ
	RnuCsrp4YyZaYEjQ2IL+W9qlGiDbLYs5+oATxQStmX4WuT/RlFlDh9a1JM+DcLRUL0hrAo
	9q2JBSEsMOMU11okSfaF39UOHZgB6iUsFvSSuwfWsZ0/FJJ8UBLCUngHsCmouw==
Date: Mon, 18 Mar 2024 00:30:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.9
Message-ID: <20240317233017c4c35cab@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_163023_926347_30C11C26 
X-CRM114-Status: UNSURE (   6.44  )
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

Here is the I3C subsystem pull request for 6.9. Not much this cycle with
only 3 patches.

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.9

for you to fetch changes up to 8f06fb45853900b4deaa52e2a9e16f3d9550b011:

  i3c: Make i3c_bus_type const (2024-02-19 21:23:28 +0100)

----------------------------------------------------------------
I3C for 6.9

Core:
 - i3c_bus_type is now const

Drivers:
 - dw: disabling IBI is only allowed when hot join and SIR are disabled

----------------------------------------------------------------
Dylan Hung (1):
      i3c: dw: Disable IBI IRQ depends on hot-join and SIR enabling

Krzysztof Kozlowski (1):
      dt-bindings: i3c: drop "master" node name suffix

Ricardo B. Marliere (1):
      i3c: Make i3c_bus_type const

 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml | 2 +-
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml    | 2 +-
 Documentation/devicetree/bindings/i3c/i3c.yaml                | 4 ++--
 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml       | 2 +-
 Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 2 +-
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 2 +-
 drivers/i3c/internals.h                                       | 2 +-
 drivers/i3c/master.c                                          | 2 +-
 drivers/i3c/master/dw-i3c-master.c                            | 4 +++-
 9 files changed, 12 insertions(+), 10 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
