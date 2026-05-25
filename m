Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADF9CD5BC9
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 14:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JsQW0DJ/KHUxZXCHz7yfrkzZopqxCIp2QLeW5cV8GMc=; b=lD8IPCALTxfEEV
	sEu55T8o2heRcO3F30CaW3Jin8novXeBhJplTIPE59rSoaD03giJyeRWqNZYaEiWtBxUtTo62eAcS
	m7XYR4SltZTz2N3YaExS8rs/jNRXUKVfR4zaSFLs83r70ECXtpFgFvA4YyLQ8AkJGnKW1D2sPedy0
	bXskxOO4YBz1tlirZNF41Z/DVECxqgisFwHfJRppD1SBVX2KOtDvnAUP5UBZrvmWULFa9QwEaboOc
	kVJFk1QVKz1iEbBhqwQ8sAVURa8qsJW8QYboIeIi/+Twh78nlONGA0Q6IHWqI9sPEP5lpu4eVpSnO
	eVaEMrGZLFdWpI5Pcetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW9T-0000000HP3z-12Zi;
	Mon, 25 May 2026 14:19:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW9Q-0000000HP3W-3g3J
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 14:19:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B36AE43AF0;
	Mon, 25 May 2026 14:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0CB1F000E9;
	Mon, 25 May 2026 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779718767;
	bh=k9jJg9Yo/2FiEOE6zivQiV7XMOjReA8/ZmgaPuTURGY=;
	h=From:To:Cc:Subject:Date;
	b=GrY3zSkdP041jTa8KaJMZEPNQJKEZnbcI7bJxxz0/oXu7HySptVfU78fowUXAFuOz
	 SXBAE/9Fs2oyZQinux+1dK6bWZuSE24PUXww7IEY+zjMD+lrWXVXBSzDrfFl7ydZ3R
	 ZESGZFrPaZNrGGEy83F+Gv1wNaayPX8oVX8kIYeZBJeHSjiFD2Ic0J0a9kMrUwzsvq
	 NCeQz1a7PhOWj/KYem+ygROdaliqBgq0B/VlqRYoUgl5n0eisROA2yeoQRvFjgphIg
	 v9AqRdZKsEWvsVrqc/ZHtmry9Su5MUptAp4C59ghzBDPs8On1glgjkjwAfWnOxT+0y
	 +njGUrplRuzlw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/3] i3c: dw: Add apb reset support
Date: Mon, 25 May 2026 22:00:15 +0800
Message-ID: <20260525140018.19598-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_071928_937614_A76E7DF9 
X-CRM114-Status: UNSURE (   8.78  )
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

Add support of apb reset which is to reset the APB interface.
The first patch is to document the exisiting reset dt-binding. 2nd patch
is to add apb reset dt-binding. The last patch is to add apb reset
support.

NOTE: to align with "core_rst", the new added apb reset is named as
"apb_rst", IOW, the reset names: "core_rst" + "apb_rst". I can modify
it if maintainers prefer "core_rst" + "apb"

Since v3:
  - back to v2, I.E keep the "_rst" suffix, since removing it is an
    ABI breakage.

Since v2:
  - remove "_rst" suffix

Since v1:
  - add dt-binding


Jisheng Zhang (3):
  dt-bindings: i3c: dw: Describe core reset
  dt-bindings: i3c: dw: Add apb reset
  i3c: dw: Add apb reset support

 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml    | 10 ++++++++++
 drivers/i3c/master/dw-i3c-master.c                     |  7 +++++++
 drivers/i3c/master/dw-i3c-master.h                     |  1 +
 3 files changed, 18 insertions(+)

-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
