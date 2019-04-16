Return-Path: <SRS0=s+0C=SS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783CEC10F13
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 06:00:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49B2720868
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Apr 2019 06:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J/OhDanb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49B2720868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zS+4EUGZWjTVTjBNlMBFvOCXXp9k1hZ0skl7KMHLJBw=; b=J/OhDanbO0/S27
	voEIaTtXniDFInat6wsh8B7OKb59z84BshaZDoYo+q2uXOsbFwTMxrnP8g2FYJkx2E/H5vKOA2Ybw
	No9/zd6jRSAqqSo2CaxnPuKb9V7P/WX7LK0NxiT3v0LkwcHqOy7gpJtxgiGdHcKge8+afCET4lzVb
	SgK8gL7Jv1dZVqdnf7iKBmN9NVzLTbFMAZ2gsFrGfKQkvBKpxdAKu4u+UyE6LDIPXcIZ3usR+Nulv
	znrXdEZzE4cjBEE/QJFJvIf2jADV2zkJHS2vF6MmtUz43o8SbbgjMWgfurTU8mqK1gjCsLlRVOZ+1
	xmw6e662w0GdnrMCI5FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGH9O-0003SI-RI; Tue, 16 Apr 2019 06:00:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGH9L-0003Ra-1v
 for linux-i3c@lists.infradead.org; Tue, 16 Apr 2019 06:00:56 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4F4A6260C42;
 Tue, 16 Apr 2019 07:00:53 +0100 (BST)
Date: Tue, 16 Apr 2019 08:00:49 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <vitor.soares@synopsys.com>
Subject: Re: [PATCH 2/3] i3c: add mixed limited bus mode
Message-ID: <20190416080049.5a6053b0@collabora.com>
In-Reply-To: <a3bf32dadd9b0135442526cc77fec5726e6e617d.1555350118.git.vitor.soares@synopsys.com>
References: <cover.1555350118.git.vitor.soares@synopsys.com>
 <a3bf32dadd9b0135442526cc77fec5726e6e617d.1555350118.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_230055_356112_615357E1 
X-CRM114-Status: GOOD (  17.72  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, joao.pinto@synopsys.com,
 linux-kernel@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

On Mon, 15 Apr 2019 20:46:42 +0200
Vitor Soares <vitor.soares@synopsys.com> wrote:

> The i3c bus spec define a bus configuration where the i2c devices

		   ^defines			    I2C devices...

> doesn't have the 50ns filter yet they allow the SDR max speed.

  ^don't	^ a 50ns filter but support SCL running at SDR max
rate (12MHz).

> 
> This patch introduce the limited bus mode so the users can use

	     ^introduces		    ^ so that users

> a higher speed on presence of i2c devices index 1.

		 ^in

> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: <linux-kernel@vger.kernel.org>
> ---
>  drivers/i3c/master.c       | 5 +++++
>  include/linux/i3c/master.h | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 1c4a86a..46d3774 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -463,6 +463,7 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
>  static const char * const i3c_bus_mode_strings[] = {
>  	[I3C_BUS_MODE_PURE] = "pure",
>  	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
> +	[I3C_BUS_MODE_MIXED_LIMITED] = "mixed-limited",
>  	[I3C_BUS_MODE_MIXED_SLOW] = "mixed-slow",
>  };
>  
> @@ -575,6 +576,7 @@ int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
>  			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
>  		break;
>  	case I3C_BUS_MODE_MIXED_FAST:
> +	case I3C_BUS_MODE_MIXED_LIMITED:
>  		if (!i3cbus->scl_rate.i3c)
>  			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
>  		if (!i3cbus->scl_rate.i2c)
> @@ -2481,6 +2483,9 @@ int i3c_master_register(struct i3c_master_controller *master,
>  				mode = I3C_BUS_MODE_MIXED_FAST;
>  			break;
>  		case I3C_LVR_I2C_INDEX(1):
> +			if (mode < I3C_BUS_MODE_MIXED_LIMITED)
> +				mode = I3C_BUS_MODE_MIXED_LIMITED;
> +			break;
>  		case I3C_LVR_I2C_INDEX(2):
>  			if (mode < I3C_BUS_MODE_MIXED_SLOW)
>  				mode = I3C_BUS_MODE_MIXED_SLOW;
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 44fb3cf..740235e 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -250,12 +250,17 @@ struct i3c_device {
>   *			     the bus. The only impact in this mode is that the
>   *			     high SCL pulse has to stay below 50ns to trick I2C
>   *			     devices when transmitting I3C frames
> + * @I3C_BUS_MODE_MIXED_LIMITED: I2C devices without 50ns spike filter are
> + *				present on the bus. However they allows
> + *				compliance up to the maximum SDR SCL clock
> + *				frequency.

						    However they support
				SCL clock running at maximum SDR rate
				(12.5MHz).

>   * @I3C_BUS_MODE_MIXED_SLOW: I2C devices without 50ns spike filter are present
>   *			     on the bus
>   */
>  enum i3c_bus_mode {
>  	I3C_BUS_MODE_PURE,
>  	I3C_BUS_MODE_MIXED_FAST,
> +	I3C_BUS_MODE_MIXED_LIMITED,
>  	I3C_BUS_MODE_MIXED_SLOW,
>  };
>  

The code itself looks good.

Thanks,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
