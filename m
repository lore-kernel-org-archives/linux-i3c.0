Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4D1C83F27
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Jul 2025 11:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UETCmhKOFR3mPEexow0CQZjAz1wsKSqaJKz04vcl4Ag=; b=UiHB6WD6/3lRjm
	5puOxGlQ+Rmsi0Y/CvoyDowLf1AZaHn2bsN/Sxo8u35OyibKga+bLXHXmfnwjXGAXgsx9QMiQHYOD
	8XvrucYtA40xVihi7nU8ha88y4csZNtZ7sY/F9TL+/D5zD643QR6YmsRdS1bRFPhMl0vKU6OAmZQ1
	Uq2be5Ae779gAtIqz1aZFVqo3N/QlUxfGWuf9FRcBr1yH4OIz+hyRMEDZYuWWXv/WRoPNSoqOVwuq
	A1bSEKxiSBBCo30JaUkicp3ct5G2QOTE5zHZPTJbSVPP+RoEUDhiqA+hT7FdzhEE2seZQl/DUZz8U
	SvdcWevhXA0Z02fyIQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0hb-00000007bXm-3GnG;
	Wed, 16 Jul 2025 11:53:35 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0hX-00000007bVA-2702
	for linux-i3c@lists.infradead.org;
	Wed, 16 Jul 2025 11:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Nd+u
	5rHVgfOlRaJ/WUxx0emekX1DNctLq0yZ2TyMLdE=; b=CQq9LCj+mPJsV13BV8St
	NNFRPb7EujCGrZrNr60wo9cHgMUsJrAbldKPi4E9khCqS9gED+k/Ch+5TSUo2hDw
	ugYW69QEH5VCE37C8MiXWkvXU7dFAv6Tj/CIFG+8AvyYZASwd9TaIP8t3DDIcwGO
	d5j6C4pOxYUZYted2UqU+s1lD0R4IR/IwSA2V+SA2ma9axYvn5rFkPYfRD2hARtc
	AIhnWVbAziWzBfkMyK5b88tmnBtetSml2mCQGBWR5Psh0O7ZM3qST01WbK45nEWB
	AD/6q0wWuXSO6h5ZJnvvsQh57Hnk6F3JXrKsfFnm+6KhYdgYIje61q1flZdcW9q0
	zA==
Received: (qmail 3297432 invoked from network); 16 Jul 2025 13:53:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jul 2025 13:53:27 +0200
X-UD-Smtp-Session: l3s3148p1@CRVtigo6Kqkujnta
Date: Wed, 16 Jul 2025 13:53:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: add driver for Renesas I3C controller
Message-ID: <aHeStuQ4ymIlyNE4@shikoro>
References: <20250714091211.20497-1-wsa+renesas@sang-engineering.com>
 <20250714091211.20497-3-wsa+renesas@sang-engineering.com>
 <aHZuAIP5IBoulm+9@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aHZuAIP5IBoulm+9@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_045332_400562_3DB17A34 
X-CRM114-Status: GOOD (  29.68  )
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

Hi Frank,

thank you for the review!

> Suggest commit message:
> 
> i3c: master: Add basic driver for Renesas RZ/G3S and G3E SoCs
> 
> Add a basic I3C master driver for the I3C controller found in Renesas
> RZ/G3S and G3E SoCs. Support I3C pure busses (tested with two targets) and
> mixed busses (two I3C devices plus various I2C targets). DAA and
> communication with temperature sensors worked reliably at various speeds
> 
> Missing features such as IBI, HotJoin, and target mode will be added
> incrementally.

Ok, I wil use this message. Thanks for providing it.

> > +F:	drivers/i3c/master/renesas-i3c.c
> 
> Add i3c mail list?

It is inherited from the I3C subsystem entry.

> > +#define STDBR			0x74
> > +#define  STDBR_SBRLO(cond, x)	FIELD_PREP(GENMASK(7, 0), (x) >> (cond))
> > +#define  STDBR_SBRHO(cond, x)	FIELD_PREP(GENMASK(15, 8), (x) >> (cond))
> 
> I think pass down od_low_ticks instead of cond will be easy to understand.
> 
> STDBR_SBRLO(l, x) FIELD_PREP(GENMASK(7, 0), (x) >> ((l) > 0xFF > 1: 0)

Well, I think the fact that you got it wrong is indicating that it is
not so easy to understand :) It should be:

STDBR_SBRLO(l, x) FIELD_PREP(GENMASK(7, 0), (x) >> ((l) > 0xFF ? 1: 0)

I also think it won't gain us much. We still need the 'double_SBR'
variable to set a specific bit at the same time we use the macro.
Unless you want a dedicated macro for STDBR_DSBRPO as well.

> But still strange,  l > 0xFF, you just shift right just 1 bits.

Yes.

> what's happen if l is 0x3ff.

The driver bails out:

+	if ((od_low_ticks / 2) > 0xFF || pp_low_ticks > 0x3F) {
+		dev_err(&m->dev, "invalid speed (i2c-scl = %lu Hz, i3c-scl = %lu Hz). Too slow.\n",
+			(unsigned long)bus->scl_rate.i2c, (unsigned long)bus->scl_rate.i3c);
+		ret = -EINVAL;
+		return ret;
+	}

Oh, the last two lines can be merged into one...

> 
> > +#define  STDBR_SBRLP(x)		FIELD_PREP(GENMASK(21, 16), x)
> > +#define  STDBR_SBRHP(x)		FIELD_PREP(GENMASK(29, 24), x)
> > +#define  STDBR_DSBRPO		BIT(31)
> > +
> > +#define EXTBR			0x78
> > +#define  EXTBR_EBRLO(x)		FIELD_PREP(GENMASK(7, 0), x)
> > +#define  EXTBR_EBRHO(x)		FIELD_PREP(GENMASK(15, 8), x)
> > +#define  EXTBR_EBRLP(x)		FIELD_PREP(GENMASK(21, 16), x)
> > +#define  EXTBR_EBRHP(x)		FIELD_PREP(GENMASK(29, 24), x)
> 
> did this pass check_patch.sh? I remember need (x)

Yes, it passed.

> maybe run check_patch.sh --strict

I used --strict. Does it complain on your side?

> > +static void i3c_reg_update_bit(void __iomem *base, u32 reg,
> > +			       u32 mask, u32 val)
> > +{
> > +	i3c_reg_update(base + reg, mask, val);
> > +}
> 
> It is similor to regmap. If you use mmios' regmap, needn't above help
> functions.

Is this a suggestion or a requirement? I'd like to keep it this way.

...

> > +static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
> > +					struct i2c_msg *i2c_xfers,
> > +					int i2c_nxfers)
> > +{
> > +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> > +	struct renesas_i3c *i3c = to_renesas_i3c(m);
> > +	struct renesas_i3c_xfer *xfer;
> > +	struct renesas_i3c_cmd *cmd;
> > +	u8 start_bit = CNDCTL_STCND;
> > +	int ret, i;
> > +
> > +	if (!i2c_nxfers)
> > +		return 0;
> > +
> > +	renesas_i3c_bus_enable(m, false);
> > +
> > +	xfer = renesas_i3c_alloc_xfer(i3c, 1);
> > +	if (!xfer)
> > +		return -ENOMEM;
> > +
> > +	init_completion(&xfer->comp);
> > +	xfer->is_i2c_xfer = true;
> > +	cmd = xfer->cmds;
> > +
> > +	if (!(i3c_reg_read(i3c->regs, BCST) & BCST_BFREF)) {
> > +		cmd->err = -EBUSY;
> > +		goto out;
> > +	}
> > +
> > +	i3c_reg_write(i3c->regs, BST, 0);
> > +
> > +	renesas_i3c_enqueue_xfer(i3c, xfer);
> 
> You can use refer mutex GUARD define to pair renesas_i3c_enqueue_xfer()
> and renesas_i3c_dequeue_xfer().

Well, looking again, I won't need this. There is no 'goto out' after
enqueueing. So, the label is wrongly placed. Might be an argument to
remove it...

> 
> > +
> > +	for (i = 0; i < i2c_nxfers; i++) {
> > +		cmd->i2c_bytes_left = I2C_INIT_MSG;
> > +		cmd->i2c_buf = i2c_xfers[i].buf;
> > +		cmd->msg = &i2c_xfers[i];
> > +		cmd->i2c_is_last = (i == i2c_nxfers - 1);
> > +
> > +		i3c_reg_set_bit(i3c->regs, BIE, BIE_NACKDIE);
> > +		i3c_reg_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> > +		i3c_reg_set_bit(i3c->regs, BIE, BIE_STCNDDIE);
> > +
> > +		/* Issue Start condition */
> > +		i3c_reg_set_bit(i3c->regs, CNDCTL, start_bit);
> > +
> > +		i3c_reg_set_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
> > +
> > +		wait_for_completion_timeout(&xfer->comp, m->i2c.timeout);
> > +
> > +		if (cmd->err)
> > +			break;
> > +
> > +		start_bit = CNDCTL_SRCND;
> > +	}
> > +out:
> > +	renesas_i3c_dequeue_xfer(i3c, xfer);
> > +	ret = cmd->err;
> > +	kfree(xfer);
> 
> struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);

... by doing this.

> > +		/* Clear the Transmit Buffer Empty status flag. */
> > +		i3c_reg_clear_bit(i3c->regs, BST, BST_TENDF);
> 
> Are you sure you can clear FIFO empty status? Generally it is read only.

Yes. The datasheet says so. If you want to double check, page 1715 of
the document which link I provided last time.

Thanks for the input, I will work on this now...

   Wolfram


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
