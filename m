Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B52C54F54
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Jul 2026 16:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqfEmKBeaMzRKVvTs05tYgpc8oJZQbZTudcoGpkTcBw=; b=iX0exzDHvzopps
	NVDK70tnYS1yGwk39/CgcjI+ywQLLwEaVo7a6WGavwQ9W4DtTObtqtvjxIoKtXG75PHA1V0ahZA3p
	QEDfw3FP7kHxbepx8iO3MyYpW9HfFfTQgk6ZoA0y9wmaUAL/KzgfWnH3AYfmJWK1JrfgVABkaOXws
	J+zvllqJUBu1ukTEnPAPtoMHsu0RLfgv4hG95EtwIXn8JvJUNZF5rOfgZUsiv0KUr1upE7gQJYjnE
	g4SG4yITHw9J+t0RUYszL7kvCNJ/LDrBId43JTWjn8f4N9KeihSKNnfHuyrhZ0q2QVYUo9iwNFWQg
	xUfuFACyDAh+LfWnfr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppqO-0000000Cxyd-2qqk;
	Fri, 31 Jul 2026 16:12:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppqN-0000000Cxxs-2YpO
	for linux-i3c@lists.infradead.org;
	Fri, 31 Jul 2026 16:12:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F1D0401B4;
	Fri, 31 Jul 2026 16:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A561F00AC4;
	Fri, 31 Jul 2026 16:12:15 +0000 (UTC)
Message-ID: <70e144cc-3c8e-473f-9a1c-b478d1dc5a6e@tuxon.dev>
Date: Fri, 31 Jul 2026 19:12:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: renesas: Don't register devices when ENTDAA times
 out
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
 biju.das.jz@bp.renesas.com, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On 7/31/26 10:01, Tommaso Merciai wrote:
> renesas_i3c_daa() derives the number of newly assigned dynamic addresses
> from cmd->rx_count, which the response ISR sets to the number of address
> slots ENTDAA left unassigned. It starts out as zero, which already means
> "every address was assigned", so a timed out transfer leaves that value
> in place and it gets used as a result.
> 
> On a bus with no target connected the ENTDAA times out and the driver
> registers RENESAS_I3C_MAX_DEVS devices that are not there, each costing
> the core two seconds on a GETPID that can only time out:
> 
>    i3c i3c-0: Failed to add I3C device at address 9, error -110
>    ...
>    i3c i3c-0: Failed to add I3C device at address 16, error -110
> 
> Start from maxdevs instead: no address is assigned before ENTDAA runs,
> and the existing rx_count >= maxdevs check then reports an empty bus.
> 
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Signed-off-by: Tommaso Merciai<tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
