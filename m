Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F158CCF2EB
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Oct 2026 14:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08MT6lW8cKhuP48fhoOnk4JJBxahy2RdlK4jPQ3BdpY=; b=fmo1YZNAAvD313
	ISBoKvfSVjC6ufR2iLfVV/efITEfFPI08MpbNANzvXPWUCK6IjUcBuis6zrynp84vWkzaeF2J/zGR
	ku6ud81sqCPpWS9kEPA+8F2PLFg7pw86rIGjTZaZ0AnktG66511xIlP7k2O+cOqAPE6FO8Gs+T1ik
	psw0su6CrzyJXlDTc0eTACj/yuZ7gNytjsMQOkiTcbPQajCOLL0Pc9Nj3JxUDO0/nM74pi91K2CjE
	CDiKJorfn7XJZ+cCowg3UOuUVzus/13oF64DJh5uiaJMIqZVSAmFzfEe5RiI4/zZGx1l117a0+NBC
	wwn0zouXh1n8wIQEf7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoJS-00000007jpw-03pj;
	Mon, 19 Oct 2026 14:26:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoJQ-00000007jpp-0QYe
	for linux-i3c@lists.infradead.org;
	Mon, 19 Oct 2026 14:26:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40A4A60136;
	Mon, 19 Oct 2026 14:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FC91F000C4;
	Mon, 19 Oct 2026 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792419962;
	bh=5c7yVaLtr9x4fkx2BIkC1OF7uxkwFHyouac+2BuosV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gK829uGJwuHy0+KUuUByxqIxBVMzXAoNbSej8eAWfvgRaS+5YW1j5+tGZBOxMj5AK
	 gjd5XvAqtMkOyARij0M6L/Ah0i2oee/l2wDD3B49iLnn8SmyztKaHkYKo8aBhnPD9k
	 wkOh48gpxMWMlmBM3OwydpOuj4uUlBzxW1HFZv+VdxeZx9bR5P4W+tkaf2QiED27BG
	 Bc6O/HBPILIPgOnuCN4ZLwYJxMUqdBUs/paPiIukoYGJRptYqDoMIaT+65zVg3zQ3V
	 6Z/6WVtoJ/VY9LnLw6z3I/Dr4i1doDDnl5g7ZuqbGp8GalMl5Ao9MQ6ZVXwOjnv+XO
	 ynQq2sStMJcSw==
Date: Mon, 19 Oct 2026 15:25:55 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	mfd@lists.linux.dev, Frank.Li@nxp.com, lgirdwood@gmail.com,
	linux-gpio@vger.kernel.org, linusw@kernel.org, brgl@kernel.org,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [RFC PATCH 7/7] gpio: p3h2x4x: add GPIO expander for the NXP
 P3H2x4x I3C hub
Message-ID: <20261019142555.GB2663669@google.com>
References: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
 <20261016164625.3166779-8-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261016164625.3166779-8-lakshay.piplani@nxp.com>
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

On Fri, 16 Oct 2026, Lakshay Piplani wrote:

> Expose the pins of the target ports placed in GPIO mode as a gpio_chip, so
> the hub can be used as an IO expander.
> 
> Each port contributes two lines, the SCL pin first, so target port N owns
> the lines 2 * N and 2 * N + 1, and the line number is also the port bit
> position in the direction and level registers. Ports that carry bus traffic
> are masked out through init_valid_mask. The port function is taken from the
> device tree rather than from the GPIO mode register, because the hub child
> that programs that register and this child are independent MFD devices with
> no probe ordering guarantee.
> 
> Direction is the output enable: clearing it leaves the pin in Hi-Z. An
> output drives the level before the buffer is enabled to avoid a glitch, and
> the input level register is used for reads in both directions. These
> registers are not protected, so the callbacks do not take the shared
> register lock. Implement get_multiple and set_multiple so an access to all
> lines of the hub costs two register accesses instead of one per line.
> 
> Interrupts on input level changes are not supported yet: they arrive as an
> I3C in-band interrupt and the edge detection configuration is shared by
> groups of four ports.
> 
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/gpio/Kconfig        |  11 ++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-p3h2x4x.c | 294 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/p3h2840.c       |   5 +

This needs to be a separate patch.

>  5 files changed, 312 insertions(+)
>  create mode 100644 drivers/gpio/gpio-p3h2x4x.c

-- 
Lee Jones

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
