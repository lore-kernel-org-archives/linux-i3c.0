Return-Path: <SRS0=zTQb=DO=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A97C4363D
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Oct 2020 10:18:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B95020870
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Oct 2020 10:18:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZIwDZGPe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B95020870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+631D/uUqX+0LcVgHbdKwF61Y9kGACUzF6OV9a3zJDk=; b=ZIwDZGPebApNPrQD3/stLXipQ
	Yxn7Fonl8kT9Yga38IOV6imdErrkmpqslsA6It7MTrpPz7+oTDFcIbAWimNDD1Hc7jpbR65S/D5qP
	bXi+exOnSdyIN8SXUHG8ZEZNSY7i4RYfBBWreljq+H/ptqqlomfFHbddDRFploso7xZ092jg9d3CD
	ER4sSbebVumH0gdIp9jCO+sbFKB+vNsKXk5gy7TerR5inWPnEtz31jrJAA3LRsUXW4gd4pUzDT453
	M6gFlyBrXl/IY2CQ/gAy6nsn1rbZYXKyMEpCrZr6mn24RcrEEGKKjbueUHOrRpDmFk360k9wHL5Xl
	lVUsBfHqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ6WP-0003E1-Cp; Wed, 07 Oct 2020 10:18:09 +0000
Received: from hillosipuli.retiisi.org.uk ([2a01:4f9:c010:4572::81:2]
 helo=hillosipuli.retiisi.eu)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ6WL-0003DD-LO
 for linux-i3c@lists.infradead.org; Wed, 07 Oct 2020 10:18:07 +0000
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk
 [IPv6:2a01:4f9:c010:4572::80:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 542B8634C87;
 Wed,  7 Oct 2020 13:17:19 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
 (envelope-from <sakari.ailus@retiisi.org.uk>)
 id 1kQ6Vb-0001nz-3g; Wed, 07 Oct 2020 13:17:19 +0300
Date: Wed, 7 Oct 2020 13:17:18 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v2 2/2] i3c/master: add the mipi-i3c-hci driver
Message-ID: <20201007101718.GA6413@valkosipuli.retiisi.org.uk>
References: <20200819031723.1398378-1-nico@fluxnic.net>
 <20200819031723.1398378-3-nico@fluxnic.net>
 <20201001123103.GJ2024@valkosipuli.retiisi.org.uk>
 <nycvar.YSQ.7.78.906.2010051528570.2184@knanqh.ubzr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.78.906.2010051528570.2184@knanqh.ubzr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_061805_983953_CDFEF41C 
X-CRM114-Status: GOOD (  50.26  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Laura Nixon <laura.nixon@team.mipi.org>, linux-i3c@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Matthew Schnoor <matthew.schnoor@intel.com>,
 Robert Gough <robert.gough@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Nicolas,

On Mon, Oct 05, 2020 at 06:15:59PM -0400, Nicolas Pitre wrote:
> On Thu, 1 Oct 2020, Sakari Ailus wrote:
> =

> > Hi Nicolas,
> =

> Hello Sakari,
> =

> Thanks for your review.
> =

> > Thanks for the patchset. It's a big patch... it might be easier to get
> > reviews by splitting it. Feel free to do that if it's not too hard.
> =

> This is hard.  The only thing that I could split out without too much =

> pain that still can be tested is the DMA support. And there is no =

> bisectability advantage in doing so either.

Note that it does not need to be functional nor even compiled. Up to you
entirely.

> =

> > Please see my comments below.
> > =

> > On Tue, Aug 18, 2020 at 11:17:23PM -0400, Nicolas Pitre wrote:
> > > From: Nicolas Pitre <npitre@baylibre.com>
> > > +/* Data Transfer Speed and Mode */
> > > +enum hci_cmd_mode {
> > > +	MODE_I3C_SDR0		=3D 0x0,
> > > +	MODE_I3C_SDR1		=3D 0x1,
> > > +	MODE_I3C_SDR2		=3D 0x2,
> > > +	MODE_I3C_SDR3		=3D 0x3,
> > > +	MODE_I3C_SDR4		=3D 0x4,
> > > +	MODE_I3C_HDR_TSx	=3D 0x5,
> > > +	MODE_I3C_HDR_DDR	=3D 0x6,
> > > +	MODE_I3C_HDR_BT		=3D 0x7,
> > > +	MODE_I3C_Fm_FmP		=3D 0x8,
> > > +	MODE_I2C_Fm		=3D 0x0,
> > > +	MODE_I2C_FmP		=3D 0x1,
> > > +	MODE_I2C_UD1		=3D 0x2,
> > > +	MODE_I2C_UD2		=3D 0x3,
> > > +	MODE_I2C_UD3		=3D 0x4,
> > =

> > I wonder if there's something else that separates I3C and I=B2C modes. =
Should
> > the two be in a different enum?
> =

> There is only that I2C bit in the Device Address Table. Still, those =

> mode values are stored in the same register field so there is no real =

> advantage from splitting them.

Ok, fair enough.

> =

> > > +/* TID generation */
> > > +#define hci_get_tid(bits) \
> > > +	(atomic_inc_return_relaxed(&hci->next_cmd_tid) % (1 << (bits)))
> > =

> > 1U. And you don't need a modulo here, simple bitwise and is more effici=
ent.
> =

> Good point about 1U. However the compiler is smart enough to convert the =

> modulus into a bitwise "and" in the generated assembly.

I guess it depends on the compiler. Still the result of shifting 1 to the
signed bit is not defined. It might not happen in this driver but using
unsigned value there is a good practice.

> =

> > > +/* Our various instances */
> > > +extern const struct hci_cmd_ops i3c_hci_cmd_v1;
> > > +extern const struct hci_cmd_ops i3c_hci_cmd_v2;
> > =

> > As these are global symbols, I'd add a prefix such as "mipi_" to these.
> =

> Won't make a difference in the modular case... but fair enough.

The driver may be linked directly to the kernel, too.

> =

> > > +// SPDX-License-Identifier: BSD-3-Clause
> > =

> > Please read Documentation/process/license-rules.rst . IOW, BSD 3-clause
> > license alone is not one of the acceptable licenses. I also don't see a
> > need for dual licensing.
> =

> Really?
> =

> I did read Documentation/process/license-rules.rst obviously.
> =

> Let's have a look again. From that document:
> =

> |The licenses currently used, as well as the licenses for code added to t=
he
> |kernel, can be broken down into:
> |
> |1. _`Preferred licenses`:
> |
> |   Whenever possible these licenses should be used as they are known to =
be
> |   fully compatible and widely used.  These licenses are available from =
the
> |   directory::
> |
> |      LICENSES/preferred/
> |
> |   in the kernel source tree.
> =

> Incidentally, the file LICENSES/preferred/BSD-3-Clause can be found =

> there. And it contains:
> =

> |  To use the BSD 3-clause "New" or "Revised" License put the following S=
PDX
> |  tag/value pair into a comment according to the placement guidelines in
> |  the licensing rules documentation:
> |    SPDX-License-Identifier: BSD-3-Clause
> =

> There is indeed a mention in license-rules.rst that suggests: =

> "individual files can be provided under a dual license, e.g. one of the =

> compatible GPL variants and alternatively under a permissive license =

> like BSD, MIT etc." It says *can* not *must*. In fact, there is a =

> section explicitly for licenses that may only be used in a dual-license =

> setup:
> =

> |3. Dual Licensing Only
> |
> |   These licenses should only be used to dual license code with another
> |   license in addition to a preferred license.  These licenses are avail=
able
> |   from the directory::
> |
> |      LICENSES/dual/
> |
> |   in the kernel source tree.
> =

> And no BSD license is to be found there.
> =

> If still in doubt, let's see what exists in practice:
> =

> $ git grep "SPDX-License-Identifier: BSD-3-Clause\($\| \*/\)" drivers/
> drivers/crypto/talitos.h:/* SPDX-License-Identifier: BSD-3-Clause */
> drivers/firmware/ti_sci.h:/* SPDX-License-Identifier: BSD-3-Clause */
> drivers/net/dsa/sja1105/sja1105_clocking.c:// SPDX-License-Identifier: BS=
D-3-Clause
> drivers/net/dsa/sja1105/sja1105_sgmii.h:/* SPDX-License-Identifier: BSD-3=
-Clause */
> drivers/net/dsa/sja1105/sja1105_spi.c:// SPDX-License-Identifier: BSD-3-C=
lause
> drivers/net/dsa/sja1105/sja1105_static_config.c:// SPDX-License-Identifie=
r: BSD-3-Clause
> drivers/net/dsa/sja1105/sja1105_static_config.h:/* SPDX-License-Identifie=
r: BSD-3-Clause */
> drivers/remoteproc/omap_remoteproc.h:/* SPDX-License-Identifier: BSD-3-Cl=
ause */
> drivers/staging/greybus/audio_apbridgea.h:/* SPDX-License-Identifier: BSD=
-3-Clause */
> drivers/staging/greybus/tools/lbtest:# SPDX-License-Identifier: BSD-3-Cla=
use
> drivers/staging/greybus/tools/loopback_test.c:// SPDX-License-Identifier:=
 BSD-3-Clause
> drivers/usb/serial/keyspan_usa26msg.h:/* SPDX-License-Identifier: BSD-3-C=
lause */
> drivers/usb/serial/keyspan_usa28msg.h:/* SPDX-License-Identifier: BSD-3-C=
lause */
> drivers/usb/serial/keyspan_usa49msg.h:/* SPDX-License-Identifier: BSD-3-C=
lause */
> drivers/usb/serial/keyspan_usa67msg.h:/* SPDX-License-Identifier: BSD-3-C=
lause */
> drivers/usb/serial/keyspan_usa90msg.h:/* SPDX-License-Identifier: BSD-3-C=
lause */
> =

> So there are couple precedents already.

These look more like accidents rather than informed decisions to merge
BSD-only licensed code. I'd still say no.

> > > +#define CMD_I1_DATA_BYTE_4(v)		FIELD_PREP(W1_MASK(63, 56), v)
> > =

> > I'm not sure W*_MASK() macros are helpful here. I'd just use plain
> > FIELD_PREP() and BIT(). The digit after I in the macro name already sig=
nals
> > the position.
> =

> Those macros are very helpful. The spec is written in terms of bit =

> numbers from 0 through 127. Manually converting those into the 32-bit =

> word that the hardware interface uses is error prone.

Ah, if it's in the spec, then it indeed helps to keep them the same. Feel
free to keep as-is.

> > > +static int hci_cmd_v1_prep_ccc(struct i3c_hci *hci,
> > > +			       struct hci_xfer *xfer,
> > > +			       u8 ccc_addr, u8 ccc_cmd, bool raw)
> > > +{
> > > +	u_int dat_idx =3D 0;
> > =

> > Please use unsigned int instead. Same elsewhere.
> =

> Why?

Because nobody else uses it and it expands to a standard type anyway. The
comment in types.h suggests it comes from BSDs. So there's no reason to use
it in new kernel code.

> > > +	xfer->cmd_tid =3D hci_get_tid(4);
> > =

> > Why 4 and e.g. not 7? A macro with a descriptive name would be nice.
> =

> The macro is:
> =

> #define hci_get_tid(bits)
> =

> but yeah... it could be in the macro name as well.
> =

> In fact, there is no longer 3-bits TID fields. They're all 4-bits wide =

> now. So I simply removed the macro argument instead.

Ok.

> > > +		DBG("next_addr =3D 0x%02x, DAA using DAT %d", next_addr, dat_idx);
> > =

> > dev_dbg() perhaps? Same elsewhere.
> =

> Nah... Given all the needed arguments and the function name prefix I =

> want, the dev_dbg() ended up spanning 3 lines whereas the DBG() wrapper =

> takes only one in most cases.

Possibly so, but creating your own debug infrastructure where it already
exists does not look like a great idea. For instance, the DBG macro does
not use the device whereas the rest assume that hci is your host controller
struct pointer. If nothing else, it's simply ugly.

> =

> > > +	}
> > > +
> > > +	if (dat_idx >=3D 0)
> > > +		i3c_hci_dat_free_entry(hci, dat_idx);
> > > +	hci_free_xfer(xfer, 1);
> > =

> > A newline before a lone return would be nice.
> > =

> > > +	return ret;
> =

> What do you mean? It is part of the cleanup and exit block which doesn't =

> make it lone anyway.

It just looks better that way. But feel free to keep it as-is.

> > > +#if 0
> > > +	if (ccc->rnw) {
> > > +		HEXDUMP("got: ", ccc->dests[0].payload.data,
> > > +				 ccc->dests[0].payload.len);
> > > +	}
> > =

> > This should probably be removed.
> =

> Well, after Boris's suggestion, I turned it into this:
> =

> 	if (ccc->rnw)
> 		DBG("got: %*ph",
> 			ccc->dests[0].payload.len, ccc->dests[0].payload.data);
> =

> But yes, this should go eventually. Not yet though.

That looks better.

> > > +		return -EPROTONOSUPPORT;
> > =

> > I'd just use -EINVAL.
> =

> -EINVAL is widely used already. Let's try to report more precise errors =

> when we can.

Ok.

-- =

Kind regards,

Sakari Ailus

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
