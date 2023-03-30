Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6134C6FD1D
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 13:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nc3RlCZRtbLUx9Mu6VMARGV+S427aCk40euA3BYnDno=; b=DPFiK1SWM0D/3T
	EC99J67jSCN2x8ASRcunmQfFm7sLqqOmCGfUs8XUlXQlXgOR6PhPhob21yJUdnNjWGWvXKOUivxHb
	koVRhKVeBwdGpuqRzC+UZdc2S72cDTPwXFd4KDrwtJCrx0TgCdO/d+9G4yD6ujQ02dc2Vm9MjzhX0
	VQAYfts9T2jQXhsa/T6ApZr992Ye7A9SLUBUYeSk1IwiFnYeZbtLFj2TXTGRyWABcx6OYcoK9hEa9
	NH48j8qA7moLcNVll7LL9yx6NVVnZNWO89QzAg9NSJgSR/AjyvDbJckhkU09yaERnwyAgiJTJkG7d
	jL6jegM2HvyUUiUV71aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phscu-003vU3-1M;
	Thu, 30 Mar 2023 13:47:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phn3a-002yjj-2C
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 07:50:52 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id B27B82009F; Thu, 30 Mar 2023 15:50:48 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680162648;
	bh=Kg4RvNsz9EB2sUJekpfj6PtAgBboCrXADVY5IKaBblc=;
	h=From:To:Cc:Subject:Date;
	b=Secu7jTNqOEuVqcKXtXGmq5RH9/l3fEi3gZu1gxLGsgr3zC74u3v9U4EcU75TgxYv
	 aWxtdWyvPFrC7XV6ks1TEty2aN4rOvf647zQFcLx9XNvowPC7ZDVu+Kd5G2OZHWXmx
	 XHQJoORFNOkuexRbY/HKCoQVcBOZDVXuRdjCt9itNW4UbT1YatCuZwNStUezrfhJpg
	 Xkwq8RXM/xvYzCBayevmqbJigheZ5wX9FkAdxy4jebIdvVYRkidfIcw4RPu78Eo9rL
	 HdtEYFCiPD+HtntEo/AhATWFfodsINZ/rECPzscrartFgodqfd5XP9INUhVmCrowHM
	 qLTZjgh6mK2Xw==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/5] i3c: dw,ast2600: Add In-Band Interrupt support
Date: Thu, 30 Mar 2023 15:50:31 +0800
Message-Id: <cover.1680161823.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_005050_912600_AE90FB34 
X-CRM114-Status: UNSURE (   6.23  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 30 Mar 2023 06:47:39 -0700
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

This series implements In-Band Interrupt (IBI) support for the ast2600
i3c driver, by adding the required generic code in the dw driver, then
enabling that (with a required hardware workaround) in the ast2600
driver.

As always: comments, queries etc. are most welcome.

Cheers,


Jeremy

Jeremy Kerr (5):
  i3c: dw: Create a generic fifo read function
  i3c: dw: Turn DAT array entry into a struct
  i3c: dw: Add support for in-band interrupts
  i3c: dw: Add a platform facility for IBI PEC workarounds
  i3c: ast2600: enable IBI support

 drivers/i3c/master/ast2600-i3c-master.c |  21 ++
 drivers/i3c/master/dw-i3c-master.c      | 336 ++++++++++++++++++++++--
 drivers/i3c/master/dw-i3c-master.h      |  32 ++-
 3 files changed, 370 insertions(+), 19 deletions(-)

-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
