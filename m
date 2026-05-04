Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A44FCD3430
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 14:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bJrFCG3OiXxA/1GAu5IDJzEZXTeG6AsukaJqV4/D84=; b=F1pEy+HbNCqwMY
	ujpE7MzU2ghHItE/PxNymMgfGgrpnedWatIoA5v2bq+aXi87sDGqMVSYThLYvy+cblT9BiRpm+vfX
	UBSGcSBzeYMM7skHFDcor4M5Zv/y1bL7Hyi0s197u1CXfG+yXZctcdvwVjkziMQHKWkvp598aNzbs
	bCJHTUXa4e7yTRJ50pmi6czP539zXehQyDY1gUkBo6lk7CCtqQIlaPBL+2xVIMZnZO6f39g8W29L9
	Q88Icnu5FKpjH/FOvW03wXOhtFg30sg1Gdm4prFaMGAeYrqW50QEvcwIUnuQ7SnrjDO0H3fQaujBR
	QrayJ7UU2iwjNTFkeqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuir-0000000DX6m-0Lrr;
	Mon, 04 May 2026 14:56:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuio-0000000DX5k-1FIx
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 14:56:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78231444CB;
	Mon,  4 May 2026 14:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9353C2BCC4;
	Mon,  4 May 2026 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906593;
	bh=KtagOfNLEs02cUVPj4FT+pAk0pBIYBNPgs62jaR0P04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZWMKMgLDxLk8OfQEWZkHQ2/vZEF0UzjawV1RjbsheUbUR0tnauJh5gj5Ey5UfcDf
	 H+BJVA+E3umxco6Q9Ic/zwyrI1E3tp4zGaooZbUCwpYQSS7Q/M+DbU4EuhAuwKuyw0
	 PlNfJx6LjogUGtJRiBAidVhHmbbM/0lv9OhL/QtY=
Date: Mon, 4 May 2026 16:25:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: zain_zhou@realsil.com.cn
Cc: linux-staging@lists.linux.dev, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: i3c: add Realtek RTS490x I3C HUB driver
Message-ID: <2026050412-bush-rosy-959d@gregkh>
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
 <20260430121354.6253-2-zain_zhou@realsil.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260430121354.6253-2-zain_zhou@realsil.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_075634_374068_C9F90B88 
X-CRM114-Status: GOOD (  21.78  )
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

On Thu, Apr 30, 2026 at 08:13:54PM +0800, zain_zhou@realsil.com.cn wrote:
> From: zain_zhou <zain_zhou@realsil.com.cn>
> 
> Add driver for Realtek RTS490x series I3C HUB devices (RTS4900,
> RTS4901, RTS4902, RTS4903, RTS4904, RTS4906).
> 
> The I3C HUB is a smart device that provides:
>   - voltage compatibility across I3C Controller and Target devices
>   - bus capacitance isolation
>   - address conflict isolation
>   - I3C port expansion (up to 8 target ports)
>   - dual controller port support
>   - I3C and SMBus device compatibility
>   - GPIO expansion via target ports
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
> 
> Signed-off-by: zain_zhou <zain_zhou@realsil.com.cn>

We need a real name, not an email alias.

And no, please don't add new drivers to drivers/staging/ especially when
it is so easy to fix them up properly "first" before adding them to the
kernel tree.

Your TODO file is pretty easy:

> diff --git a/drivers/staging/rts490x/TODO b/drivers/staging/rts490x/TODO
> new file mode 100644
> index 000000000000..0be2d7693d68
> --- /dev/null
> +++ b/drivers/staging/rts490x/TODO
> @@ -0,0 +1,19 @@
> +TODO list for rts490xa-i3c-hub staging driver
> +==============================================
> +
> +- Move driver out of staging once the following are addressed:
> +  - Add proper DT binding schema validation (dt-schema)
> +  - Clean up open-coded OF property parsing; use device_property_* APIs
> +    instead of of_property_read_* where possible
> +  - Remove use of full_name / sscanf for node name parsing; use
> +    of_node_name_eq() and fwnode helpers instead
> +  - Replace global mutex (i3c_hub_regmap_mutex) with per-device locking
> +  - Add kernel-doc comments for all exported/public functions
> +  - Resolve TODO comment in i3c_hub_hw_configure_tp() regarding MUX
> +    connection verification
> +  - Remove TBD comment in i3c_hub_probe() regarding DEV_CMD security lock
> +  - Review and fix potential locking issues in i3c_hub_delayed_work()
> +    when registering logical buses
> +  - Fix error handling in i3c_hub_delayed_work(): early return on failure
> +    does not unregister already-registered logical buses, causing resource
> +    leak; needs proper cleanup on error path

All of those you could do this week.  Don't add stuff to staging that
you are going to maintain, as it will be more work in the end.  Just do
the needed extra effort and then merge it to the proper place in the
tree.

thanks,

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
