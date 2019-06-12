Return-Path: <SRS0=UgBl=UL=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAF7C31E46
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Jun 2019 11:37:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AED62082C
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Jun 2019 11:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="biFyPGDg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AED62082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnok/EgomPGNwxnnU3fRIz2E/DfSYmVprZ9DCoaMa40=; b=biFyPGDgfhst6F
	Uhl6lnHYqWGgJAGgMQoqls44yX9Vi8N6ZDAqAXr83HtpJ0U1Rua0q9LvOZs1gIn/GIQCOYiNJUGpJ
	8trGpL4oGdRZ1eLnDCuYv6DkEqiArfRJdAcLY+zD48dWVw0O5r5mJ1Qpk6uT32xrOMNI7BjcCPZ3h
	sQ85GenCLZLNCiVCTPq4ftgmBH59YmVQ0VC0gSeIeieMUm9wwEb/KVjVeskHnjgkFx4yKMZPEVu05
	JQqHjZN7s1m7PkMgj3KcOxk64bfyvC9Jg4IBnOF1LrzJAMR1dKCKsxcfKSQgpmTOiRm5lGD3ED+t8
	KByxecqXTyePeTT8Xbiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb1Zh-0003q4-AH; Wed, 12 Jun 2019 11:37:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb1ZM-0003VL-Tk
 for linux-i3c@lists.infradead.org; Wed, 12 Jun 2019 11:37:35 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 92630260269;
 Wed, 12 Jun 2019 12:37:30 +0100 (BST)
Date: Wed, 12 Jun 2019 13:37:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v3 1/3] i3c: fix i2c and i3c scl rate by bus mode
Message-ID: <20190612133727.48f85060@collabora.com>
In-Reply-To: <13D59CF9CEBAF94592A12E8AE55501350AABEC91@DE02WEMBXB.internal.synopsys.com>
References: <cover.1560261604.git.vitor.soares@synopsys.com>
 <b39923bda3625a5c6874755ae81cdfe85fb5abef.1560261604.git.vitor.soares@synopsys.com>
 <20190612081533.2cf9e12a@collabora.com>
 <13D59CF9CEBAF94592A12E8AE55501350AABEC91@DE02WEMBXB.internal.synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_043733_244359_8D37BAAB 
X-CRM114-Status: GOOD (  30.69  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 12 Jun 2019 11:16:34 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
> Date: Wed, Jun 12, 2019 at 07:15:33
> 
> > On Tue, 11 Jun 2019 16:06:43 +0200
> > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> >   
> > > Currently the I3C framework limits SCL frequency to FM speed when
> > > dealing with a mixed slow bus, even if all I2C devices are FM+ capable.
> > > 
> > > The core was also not accounting for I3C speed limitations when
> > > operating in mixed slow mode and was erroneously using FM+ speed as the
> > > max I2C speed when operating in mixed fast mode.
> > > 
> > > Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> > > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > > Cc: <stable@vger.kernel.org>
> > > Cc: <linux-kernel@vger.kernel.org>
> > > ---
> > > Changes in v3:
> > >   Change dev_warn() to dev_dbg()
> > > 
> > > Changes in v2:
> > >   Enhance commit message
> > >   Add dev_warn() in case user-defined i2c rate doesn't match LVR constraint
> > >   Add dev_warn() in case user-defined i3c rate lower than i2c rate
> > > 
> > >  drivers/i3c/master.c | 61 +++++++++++++++++++++++++++++++++++++++++-----------
> > >  1 file changed, 48 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > index 5f4bd52..f8e580e 100644
> > > --- a/drivers/i3c/master.c
> > > +++ b/drivers/i3c/master.c
> > > @@ -91,6 +91,12 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
> > >  	up_read(&bus->lock);
> > >  }
> > >  
> > > +static struct i3c_master_controller *
> > > +i3c_bus_to_i3c_master(struct i3c_bus *i3cbus)
> > > +{
> > > +	return container_of(i3cbus, struct i3c_master_controller, bus);
> > > +}
> > > +
> > >  static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
> > >  {
> > >  	return container_of(dev, struct i3c_master_controller, dev);
> > > @@ -565,20 +571,48 @@ static const struct device_type i3c_masterdev_type = {
> > >  	.groups	= i3c_masterdev_groups,
> > >  };
> > >  
> > > -int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode)
> > > +int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
> > > +		     unsigned long max_i2c_scl_rate)
> > >  {
> > > -	i3cbus->mode = mode;
> > >  
> > > -	if (!i3cbus->scl_rate.i3c)
> > > -		i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > > +	struct i3c_master_controller *master = i3c_bus_to_i3c_master(i3cbus);
> > >  
> > > -	if (!i3cbus->scl_rate.i2c) {
> > > -		if (i3cbus->mode == I3C_BUS_MODE_MIXED_SLOW)
> > > -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_SCL_RATE;
> > > -		else
> > > -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> > > +	i3cbus->mode = mode;
> > > +
> > > +	switch (i3cbus->mode) {
> > > +	case I3C_BUS_MODE_PURE:
> > > +		if (!i3cbus->scl_rate.i3c)
> > > +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > > +		break;
> > > +	case I3C_BUS_MODE_MIXED_FAST:
> > > +		if (!i3cbus->scl_rate.i3c)
> > > +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > > +		if (!i3cbus->scl_rate.i2c)
> > > +			i3cbus->scl_rate.i2c = max_i2c_scl_rate;
> > > +		break;
> > > +	case I3C_BUS_MODE_MIXED_SLOW:
> > > +		if (!i3cbus->scl_rate.i2c)
> > > +			i3cbus->scl_rate.i2c = max_i2c_scl_rate;
> > > +		if (!i3cbus->scl_rate.i3c ||
> > > +		    i3cbus->scl_rate.i3c > i3cbus->scl_rate.i2c)
> > > +			i3cbus->scl_rate.i3c = i3cbus->scl_rate.i2c;
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > >  	}
> > >  
> > > +	if (i3cbus->scl_rate.i3c < i3cbus->scl_rate.i2c)
> > > +		dev_dbg(&master->dev,
> > > +			"i3c-scl-hz=%ld lower than i2c-scl-hz=%ld\n",
> > > +			i3cbus->scl_rate.i3c, i3cbus->scl_rate.i2c);
> > > +
> > > +	if (i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_SCL_RATE &&
> > > +	    i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_PLUS_SCL_RATE &&
> > > +	    i3cbus->mode != I3C_BUS_MODE_PURE)
> > > +		dev_dbg(&master->dev,
> > > +			"i2c-scl-hz=%ld not defined according MIPI I3C spec\n",
> > > +			i3cbus->scl_rate.i2c);
> > > +  
> > 
> > Again, that's not what I suggested, so I'll write it down:
> > 
> > 	dev_dbg(&master->dev, "i2c-scl = %ld Hz i3c-scl = %ld Hz\n",
> > 		i3cbus->scl_rate.i2c, i3cbus->scl_rate.i3c);
> >   
> 
> I'm not ok with that change. The reasons are:
>   i3cbus->scl_rate.i3c < i3cbus->scl_rate.i2c is an abnormal use case. As 
> discuss early it can be cause by a wrong DT definition or just for 
> testing purposes.

Is it buggy, and if it is, what are the symptoms? And I'm not talking
about slow transfers here. Also, note that forcing the I2C/I3C rate
through the DT already means you want to tweak the bus speed (either
for debugging purposes or because slowing things down is needed to fix
a HW bug).

> 
>   i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_SCL_RATE && i3cbus->scl_rate.i2c 
> != I3C_BUS_I2C_FM_PLUS_SCL_RATE, the MIPI I3C Spec v1.0 clearly says that 
> all I2C devices on the bus shall have a LVR register and thus support FM 
> or FM+ modes.

Yet, you might want to apply a lower I2C freq, and this sounds like a
valid case that doesn't deserve a dev_warn().

> By  definition a FM bus works at 400kHz and a FM+ bus 1MHz.
> And for slaves, a FM device works up to 400kHz and a FM+ device works up 
> to 1MHz respectively.

*up to*, that's the important thing to keep in mind. There's no problem
driving the SCL signal at a lower freq.

> 
> Apart of that, if the I2C device support you can use a custom higher or 
> lower rate, yet not defined according MIPI I3C spec.

I'm not going to have this discussion again, sorry. I think I gave
enough arguments to explain why having an I2C SLC rate that's slower
than what I2C devices support is fine.

> 
> > dev_dbg() is not printed by default, so it's just fine to have a trace
> > that prints the I3C and I2C rate unconditionally.  
> 
> I'm ok to change the way that user is notified and I think that is here 
> the problem.
> Maybe the best is to change the first dev_dbg() to dev_warn() and the 
> second dev_info().

Same here. I'm fine having a dev_warn() when the rate is higher than
what's supported by devices present on the bus (because that case is
buggy), but not when it's lower and still in the valid range.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
