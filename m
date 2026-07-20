Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4F0C44515
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Jul 2026 16:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKQ4hKpZE5SVW8693xf8bC19G0ikvzk/hNk4E0oBq3w=; b=FGaNJvqw1yEs4K
	jBHCdsmebQVHBlGLYTsDROWUJLrzhgk4cB5AknchQMtwCqktLNClgsxEYwszjDJwuebGzr7MYilwK
	sJvwzPUxTb13+hY8YMZIGquLfn93lSfXZU4noaoO6MuhpkTBZzOlStfYZki8TRi7f6hbJZ5nwsmoa
	1kSpjHL1LTKxpeivPhjWb2MPNerUODqZvdorKhgirbJ5bcb4vCP+1kK14aI0bfcE0lXdNLRpCNBrO
	gDEI7y43r4dTP+kLi3rWdvUdYlW8MqQVf9RZgpDCp6IqQd8q25m9sVmEwakmRqbQh6ioy6E7js+ER
	4CoFEf3sYI9RozHCOE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrJw-00000007SXm-0oVy;
	Mon, 20 Jul 2026 16:58:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrJt-00000007SWc-0S6H
	for linux-i3c@lists.infradead.org;
	Mon, 20 Jul 2026 16:58:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3050C1A10FF;
	Mon, 20 Jul 2026 16:58:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E94CF60360;
	Mon, 20 Jul 2026 16:58:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3ECFA11BD0382;
	Mon, 20 Jul 2026 18:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784566698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=sM+P+g2RTd8f5vSNfAYp/vj7YrmNsi1RTFZr1XYHay8=;
	b=tjIUQFfVlf1XM2KB/X8YEK3dkAQcDmVLD/Lo4EWqOC4cAit5gx10whyi58KvI4lL5B2E6S
	8jSSPLrfvF0Oo5aTQyLcswoJxjckaIy8QlIBPvL0RXYqglUmTWeNOijqB8Des9CImEj6oR
	Dq9Gq9pI1NaTACOHjC+DcGcNvdxzcADRhmqneZpHmF5mYdt6t9svl5jDprS27osp2SpFsI
	vqpTgLlck1bkRh5kTtH1ykDHTbvXRjey+XtQYw3gBkHJIiYA0Pc50TPJmtnChAvS2ehFlX
	9lAki/Bh3LnqjosHrijDZRNBZUdyrGxJT1/oiHtrQccZuJiCdHn7dS7CwCB4Cg==
Date: Mon, 20 Jul 2026 18:58:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	Frank.Li@nxp.com, p.zabel@pengutronix.de,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 00/17] i3c: renesas: Suspend to RAM with power loss
 and runtime PM
Message-ID: <178456664247.96603.6566796474828485543.b4-ty@b4>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_095821_285609_833BABB2 
X-CRM114-Status: UNSURE (   7.65  )
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

On Mon, 13 Jul 2026 16:05:28 +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> This series adjusts the suspend to RAM code to handle cases where power
> to the connected devices is lost during suspend to RAM. The fixes
> included in this series are required for that support.
> 
> [...]

Applied, thanks!

[01/17] i3c: renesas: Check that the transfer is valid before accessing it
        https://git.kernel.org/i3c/c/1035bddb16e4
[02/17] i3c: renesas: Restore STDBR and EXTBR registers on resume
        https://git.kernel.org/i3c/c/c348fb87708e
[03/17] i3c: renesas: Follow the reset deassert order used in probe
        https://git.kernel.org/i3c/c/dfc95b9e78bc
[04/17] i3c: renesas: Reconfigure the DATBAS register on re-attach
        https://git.kernel.org/i3c/c/55316fb0ea3b
[05/17] i3c: renesas: Reset the controller on resume
        https://git.kernel.org/i3c/c/49ed0b2a3c63
[06/17] i3c: renesas: Perform Dynamic Address Assignment on resume
        https://git.kernel.org/i3c/c/afe7fbb3f652
[07/17] i3c: renesas: Clean DATBAS register on detach
        https://git.kernel.org/i3c/c/86f65337c636
[08/17] i3c: renesas: Fix out-of-bounds access for newdevs mask
        https://git.kernel.org/i3c/c/f7d9e0bee840
[09/17] i3c: renesas: Use reset_control_bulk_{assert, deassert}()
        https://git.kernel.org/i3c/c/12306f6710ae
[10/17] i3c: renesas: Return immediately if there is no transfer
        https://git.kernel.org/i3c/c/3b3a1f1778e8
[11/17] i3c: renesas: Follow a unified pattern for transfer and command initialization
        https://git.kernel.org/i3c/c/436c6afd8d5d
[12/17] i3c: renesas: Drop the explicit memset() call
        https://git.kernel.org/i3c/c/84dc0f87a62c
[13/17] i3c: renesas: Update HW registers after SW computations are done
        https://git.kernel.org/i3c/c/1a22e87cf3b9
[14/17] i3c: renesas: Organize structures to avoid unnecessary padding
        https://git.kernel.org/i3c/c/a0957ae127f6
[15/17] i3c: renesas: Use the "dev_name:irq_name" format for the interrupt name
        https://git.kernel.org/i3c/c/9d1730ad7888
[16/17] i3c: renesas: Drop unnecessary tab
        https://git.kernel.org/i3c/c/070d0ef61c08
[17/17] i3c: renesas: Add runtime PM support
        https://git.kernel.org/i3c/c/4995ae05e8e1

Best regards,

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
