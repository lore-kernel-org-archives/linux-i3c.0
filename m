Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3F7C433F5
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Jan 2022 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KU+bvI22h+pW6t7pOUmhQLBlxDYQ2Fq80MfqRVKWgy8=; b=mLRDSKe/+oUhcb
	GQXqdepWUn8UF2Acvxzw6nKyf/mlINV5B1ODdSgrUNucAg+/d8zrSmJtby7zhcs0oERv28mVm+fLr
	tLoBS6zVnjjXYuZumMeamElQNhk9RUi6QIuXQ6slW+t2FsQzC2WalV6+nYbbqWh2QmRu1qfeaJ/oe
	HTK7R1nHoW2aXUuAKCs28N/u1ZEjQL9hPz2wFKQyH/teP4ROwBNQOGOe/NjBNvUbaKzHgaK4Ghici
	yXG0MHqBmx9no0FKXf3/Ww9IrAVHz7HjTngH46WA84cU1/DYKbUmkbHfvaeerc5foKsj5PbWMuF5y
	G8JDstmQOQeu4HSlX0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n525R-00EHGo-MG; Wed, 05 Jan 2022 08:56:01 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n525E-00EHDF-Mx
 for linux-i3c@lists.infradead.org; Wed, 05 Jan 2022 08:55:51 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6C9244000B;
 Wed,  5 Jan 2022 08:55:45 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com,
	Clark Wang <xiaoning.wang@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 conor.culhane@silvaco.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 0/8] i3c: master: svc: some bug fixes and add runtime
 pm support
Date: Wed,  5 Jan 2022 09:55:44 +0100
Message-Id: <164137293677.1744375.6793157793281994769.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211227074529.1660398-1-xiaoning.wang@nxp.com>
References: <20211227074529.1660398-1-xiaoning.wang@nxp.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_005548_908475_E21C2304 
X-CRM114-Status: GOOD (  10.87  )
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

On Mon, 27 Dec 2021 15:45:21 +0800, Clark Wang wrote:
> Currently, only the fourth patch needs to be reviewed, and the rest have been
> added with your review tag.
> 
> Thank you very much for your comments! :)
> 
> V5 changes:
>  - i3c: master: svc: add support for slave to stop returning data
>    - remove <%s> in logs
>    - add some spaces
>    - !SVC_I3C_MSTATUS_STATE(reg) -> SVC_I3C_MSTATUS_STATE_IDLE(reg)
>  - i3c: master: svc: add runtime pm support
>    - create svc_i3c_master_prepare_clks() and svc_i3c_master_unprepare_clks()
> 
> [...]

Applied, thanks!

[1/8] i3c: master: svc: move module reset behind clk enable
      commit: 57d8d3fc060c7337bc78376ccc699ab80162b7d5
[2/8] i3c: master: svc: fix atomic issue
      commit: a84a9222b2be2949f11f2d7c487052ac2afed4d4
[3/8] i3c: master: svc: separate err, fifo and disable interrupt of reset function
      commit: 9fd6b5ce8523460b024361a802f5e5738d2da543
[4/8] i3c: master: svc: add support for slave to stop returning data
      commit: d5e512574dd2eb06ace859b27cafb0de41743bb5
[5/8] i3c: master: svc: set ODSTOP to let I2C device see the STOP signal
      commit: 173fcb27210b18b38f1080f1c8f806e02cf8a53b
[6/8] i3c: master: svc: add runtime pm support
      commit: 05be23ef78f76a741d529226a8764d81c719a1e3
[7/8] i3c: master: svc: add the missing module device table
      commit: c5d4587bb9a9a03b30bbc928b4a007fcd1f8c279
[8/8] i3c: master: svc: enable the interrupt in the enable ibi function
      commit: 7ff730ca458e841dbcdc87f264d7afe3eaed525e

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
