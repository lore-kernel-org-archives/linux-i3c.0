Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF17C10A88C4
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Mar 2026 15:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBGk7QSQes7rTmTnyQQKkDbMqxaLMP+vHuauHKVPaf0=; b=dZZ70mXDPD/oRh
	YipnWMg02p799m6Jdzww39Dt4F3QeYmjtUDqX73LbficUDtypleS3kZsh7gWUGOVkbWBqD9p4b6c6
	dqeVM2ly6fht/aAnZCf5AjrhCemmunILDkdni+QONvI7g1kuFe83By4Xr+YfjP+c8/UZq0Qm7+VU1
	zZI3s6KIbFgaDmle2nNRqYwo0BdlWcpfF5Vl7kBzpqD3bdikndOqczu9VkLEKoG8xCc5T13YRcPOl
	Na/wrgkrx6SPQm4SoObmMbw8uDt+sTpOabU7jmqytJGysBnlvXeyVo6QDteJa9WTdrnN9Rm2BzRoM
	lmmU3swlPQa8z1TZUs6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mU2-00000005jTQ-1PKo;
	Thu, 26 Mar 2026 15:18:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mTz-00000005jSk-3n13
	for linux-i3c@lists.infradead.org;
	Thu, 26 Mar 2026 15:18:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DAE643E81;
	Thu, 26 Mar 2026 15:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD977C116C6;
	Thu, 26 Mar 2026 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774538331;
	bh=1pNCUWUk5UquqTKdcr0V7Dl6T/ZHqBWgDbFw6S0sOmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8gm2iFFLyWBTHDO07gv6lEf+axSsmP9yKd9zsutsaHh3ZaoQfTr5K3tXupV8uQL9
	 S27q4umBJFlv8LACpOJOM2/mgQwEMGSwLeLLCeK9S0CBGoF0J/52lN+6R13aLQh3kG
	 Ra77CoJS7jTux+cp4L4a3Lgn9756Si/HnKEx2YWFUmTagKgAnXMPpYVQRWf0TM+Emx
	 QIbtBIUGN9yat3H+VxNADRRRgvhqNHLeWQ3ENM+FJBB45eyUeChQFqtCUoUlNQ474g
	 otVGJFQkoyGM4MC9AQ5ojcg4DdNiB8vZjm0esxhkJraxpT3iZkQLdfGFiGPCiJwna1
	 YASFQKzLyA4QQ==
Date: Thu, 26 Mar 2026 10:18:47 -0500
From: Rob Herring <robh@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 03/12] i3c: master: Use unified device property interface
Message-ID: <20260326151847.GB2360967-robh@kernel.org>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-4-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318172820.13771-4-akhilrajeev@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_081851_958994_DE06E508 
X-CRM114-Status: GOOD (  16.70  )
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

On Wed, Mar 18, 2026 at 10:57:16PM +0530, Akhil R wrote:
> Replace all OF-specific functions with unified device property functions
> as a prerequisite to support both ACPI and device tree.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i3c/master.c       | 91 ++++++++++++++++++++++----------------
>  include/linux/i3c/master.h |  5 ++-
>  2 files changed, 55 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index c32847bc4d0d..2c479fecbfdf 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[...]

> @@ -3300,11 +3310,14 @@ static int __init i3c_init(void)
>  {
>  	int res;
>  
> -	res = of_alias_get_highest_id("i3c");
> -	if (res >= 0) {
> -		mutex_lock(&i3c_core_lock);
> -		__i3c_first_dynamic_bus_num = res + 1;
> -		mutex_unlock(&i3c_core_lock);
> +	/* of_alias_get_highest_id is DT-specific, only call for DT systems */
> +	if (IS_ENABLED(CONFIG_OF)) {

BTW, CONFIG_OF is *always* enabled on arm64.

> +		res = of_alias_get_highest_id("i3c");

This will just return an error if not booting with DT or if CONFIG_OF is 
disabled.

> +		if (res >= 0) {
> +			mutex_lock(&i3c_core_lock);
> +			__i3c_first_dynamic_bus_num = res + 1;
> +			mutex_unlock(&i3c_core_lock);
> +		}
>  	}
>  
>  	res = bus_register_notifier(&i2c_bus_type, &i2cdev_notifier);

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
