Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518CBC0219B
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Feb 2025 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uj/WMfRDSmx3PBcsollRwHPlmlt6j83uZ59WIcKow9s=; b=S3qCgYCRQaeBb0
	cQTwe7T7dQN2whnNfA9mNI00PRXmb5wjOVl5Gec4exXhzW9tX2wtXlxPF33cedswhnOO3Svkq8cK6
	isU+biRP1+gZtDHvOKW0827u+9f3sUJihbn5MAP/IAPQNhJPu8OwragBJss0HKyVZRKqbh/ng6wsM
	P7qKQvILFauGh3NnDWdcN6ipxOoL9Hp5H8DwLViu95YvuXZJZdTp54mn40OPDGYJfkggDerI+7WVU
	DWqn9I34dx/j9sGZpuUfBcHJwUlCWReyBBwZYYHXKzZb/EqwaycR+1ANFEazLhNv6ntl2b2xB6WkW
	t0IyXJ5+5cI3PBjJwqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL7O-000000097pd-49P1;
	Fri, 07 Feb 2025 09:57:50 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFZk-000000005Kh-1PUB
	for linux-i3c@lists.infradead.org;
	Tue, 04 Feb 2025 09:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1738662634;
	bh=sFKhMsokAOxkqQ+lyfqOtMnWWCSgFyyB9tfGsKKlFDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vr0PzjdOemk9h0ggU7S03NdeZp5h3qkAhXRzIWYtvd0YzxKTz/Tul5nAbYQcEzkpg
	 QsfkAl8U+UHSlyp9EMo7LcV3uslYTffCEaO2Jm5Evqr7IrwRnYGFX1g2W+/qf/qjjx
	 bGNl9uHBtjjoOb8DeEzliMPlizscj0N4C/emw51o=
Date: Tue, 4 Feb 2025 10:50:34 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: alexandre.belloni@bootlin.com, pgaj@cadence.com, 
	miquel.raynal@bootlin.com, conor.culhane@silvaco.com, aniketmaurya@google.com, 
	Shyam-sundar.S-k@amd.com, jarkko.nikula@linux.intel.com, wsa+renesas@sang-engineering.com, 
	xiaopei01@kylinos.cn, Guruvendra.Punugupati@amd.com, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Message-ID: <f9f730b6-4620-49dd-9700-ee18f777045f@t-8ch.de>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_015036_523473_509D4A14 
X-CRM114-Status: GOOD (  11.76  )
X-Mailman-Approved-At: Fri, 07 Feb 2025 01:57:50 -0800
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

Hi Billy,

On 2025-02-04 17:17:01+0800, Billy Tsai wrote:
> The change is necessary to enable the use of the
> `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
> ensures safe handling of I2C messages when using DMA, making it essential
> for scenarios where DMA transfers are involved. By removing the `const`
> qualifier, this patch allows drivers to prepare and manage DMA-safe
> buffers directly.

This is missing a changelog to v1 of the series.

Also I asked before why it is not possible to change the signature of
i2c_get_dma_safe_msg_buf() to accept 'const struct i2c_msg *' [0].
That looks like the nicer solution to me.

> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c     | 2 +-
>  drivers/i3c/master/i3c-master-cdns.c   | 2 +-
>  drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
>  drivers/i3c/master/svc-i3c-master.c    | 2 +-
>  include/linux/i3c/master.h             | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

<snip>

[0] https://lore.kernel.org/lkml/23854752-435e-432e-ba21-caf690c0cecc@t-8ch.de/

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
