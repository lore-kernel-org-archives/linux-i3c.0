Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC40CD5BB1
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 19:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIltPVsrNC7/QBdjdVxEWdvUJov69Koq7yGygzjYvos=; b=P6TmsaY0oOfWd6
	6+pE7ZYE/f/S/7TLUmvJZWhhazK5fqoZCAjgbu3xp5bi6gLIQ0lYLMwyXAbICFR0WKI6o5tHrHMP1
	YqHMyQ4ZQzPlLq/gQ+doEB352p6WvKqMaxfEYqHDHWcn9wye1LQ9by2uZign+nEfwQJPyM3yfmQrP
	a3Olg+Gvhfx9cv9V0N/bu9ZUX03LMenUERa2k/4tB+9NriI4mUYZWpgp8Ri2df8O7baTtCNkPFXaf
	s5BM4koaWCExs/viT8ysFP5KYEVGhvpJNEuK+2FxL+CXPLzBrGaDKBz26Vk5E1SaS6SqgyMT7nWj6
	vjPHeGQ5EQyxTu4qUa0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRajL-00000000J0X-1anb;
	Mon, 25 May 2026 19:12:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRajI-00000000Izu-01QT
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 19:12:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E11F843C1C;
	Mon, 25 May 2026 19:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540A01F000E9;
	Mon, 25 May 2026 19:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779736366;
	bh=o4JyCBhL/i96DsZBh+8FLeSCmnWSweT8lWDiTgQw3T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o3hOEq4Q7s12+FwtsvAM1Us2XJ7eTXLf6U2VdjjJ3Tp2XA3Zydo/jn+d+XusDQXa8
	 O28rl7mc+zFKcPkq7Rmsy7L/yg/rrikqNn7eZpaF4Xt6qempTYBBPE6UDEl8/pricf
	 pYm8/Md8VyYwYKxXs4fvGoXcwZmUHisHvWm2Da8g=
Date: Mon, 25 May 2026 21:11:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: zain_zhou@realsil.com.cn
Cc: linux-staging@lists.linux.dev, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	wei_wang@realsil.com.cn
Subject: Re: [PATCH v2 2/2] staging: i3c: add Realtek RTS490x I3C HUB driver
Message-ID: <2026052527-boat-avid-0a74@gregkh>
References: <20260525125128.297-1-zain_zhou@realsil.com.cn>
 <20260525125128.297-2-zain_zhou@realsil.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260525125128.297-2-zain_zhou@realsil.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_121248_199711_57B4CC63 
X-CRM114-Status: GOOD (  11.83  )
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

On Mon, May 25, 2026 at 08:51:28PM +0800, zain_zhou@realsil.com.cn wrote:
> From: Yin Zhou <zain_zhou@realsil.com.cn>
> 
> Add driver for Realtek RTS490x series I3C HUB devices.
> 
> The driver supports:
>   - Device Tree based configuration of LDO, pull-up, IO strength
>     and per-port mode (I3C/SMBus/GPIO/disabled)
>   - Logical I3C bus registration per target port
>   - SMBus agent functionality with IBI and polling modes
>   - GPIO chip with IRQ support
>   - DebugFS interface for register access and DT config inspection
>   - IBI (In-Band Interrupt) handling
> 
> The driver is placed in staging as it has known issues to be resolved
> before mainlining; see drivers/staging/rts490x/TODO for details.

No, again, please do this correctly and fix up everything and put it in
the real part of the kernel.  It will only take you more work if it were
to be in staging.

thanks,

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
