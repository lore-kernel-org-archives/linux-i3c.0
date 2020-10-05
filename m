Return-Path: <SRS0=zTQb=DO=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D829C4363C
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Oct 2020 07:30:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A197D20872
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Oct 2020 07:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hlXWoGcs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="DC4Tt4Bv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="lCSqh6dv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A197D20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:
	Date:Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZqpIyjHVf+ydIhTjp1pkkS6eqNvfOTvmnms9Hf/emQ4=; b=hlXWoGcs7oKVuQKkj7N4sfddA
	Yk7OXM3KioarzrAu1r/wjZkthYf9DT45aBVFMGVxdcQio8XnuiOBTSpURGCxqqjyTen5B+iV7rNYN
	m/qkm6p0RyzXkz9yAitNpwoxiZQRp8X91tBJMaa/dRUY9G0aWD54ZFhMMLbl4JSc4uFCMgVxYNHKG
	yRuj3umtvdrLylPc0EiLiws2iVM7D+WhaAYdsiNXrUbKrzJnWptutX2y6zDXcY+9j2dxBYdTiGOv0
	gAuiaTZ8zd7tibp21nvA1MTv6+Qg86ZiEm8vcOx8r78i8pSn/1hE3yvrP4F4QW8Gx9VG3bSP9BRo3
	GMdbSzVpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ3uR-00045t-Kc; Wed, 07 Oct 2020 07:30:47 +0000
Received: from pb-smtp21.pobox.com ([173.228.157.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPYmN-0007Gf-Fd
 for linux-i3c@lists.infradead.org; Mon, 05 Oct 2020 22:16:25 +0000
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 1A213FE8C2;
 Mon,  5 Oct 2020 18:16:13 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type:content-id; s=sasl; bh=QE5QgfC/mIeDEuwEq90ctfY92a0
 =; b=DC4Tt4Bv42cVN33KBjb5OSLwa1WGPj0diYk5nl2pU1LBemObn85j92ZowSt
 f1eLMGLC/ujGIBNzJ7HFYzaMlTlLUpVrz1WFm1YMVVKKSOUv6d4LLnB/EEC2LaS7
 pnukVwS7zmtyIRBfeKAi6klJIXT2AdxeuKIHB/4jzDH/ZM9U=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 1208CFE8C1;
 Mon,  5 Oct 2020 18:16:13 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type:content-id;
 s=2016-12.pbsmtp; bh=7zJPDfYCnqNeOeiP3Lu2ajedevq86joWHA0SnIJ/p/M=;
 b=lCSqh6dvJTTx8Obc7ZTWQd2TDh+TaIs92D6uIhb0H17Dye9NDPnAhNXxg2liNj/k5W8xHSr16ufZ5kzyDyTeuI2N1hk+891zGm3DLcbOfyVyyEjz0U9Gy4zoZiT/TJSUuqv6ft4W0Jk6Jkp5HP7F/60wqXlx1eV7/qal7eF8pDw=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 3CAFBFE8B2;
 Mon,  5 Oct 2020 18:16:08 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 64BF12DA0BEB;
 Mon,  5 Oct 2020 18:15:59 -0400 (EDT)
Date: Mon, 5 Oct 2020 18:15:59 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 2/2] i3c/master: add the mipi-i3c-hci driver
In-Reply-To: <20201001123103.GJ2024@valkosipuli.retiisi.org.uk>
Message-ID: <nycvar.YSQ.7.78.906.2010051528570.2184@knanqh.ubzr>
References: <20200819031723.1398378-1-nico@fluxnic.net>
 <20200819031723.1398378-3-nico@fluxnic.net>
 <20201001123103.GJ2024@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-744515117-1601931621=:2184"
Content-ID: <nycvar.YSQ.7.78.906.2010051748050.2184@knanqh.ubzr>
X-Pobox-Relay-ID: 5E2053FA-0758-11EB-9827-D609E328BF65-78420484!pb-smtp21.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_181623_659766_ACB5DFA6 
X-CRM114-Status: GOOD (  47.94  )
X-Mailman-Approved-At: Wed, 07 Oct 2020 03:30:45 -0400
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
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-744515117-1601931621=:2184
Content-Type: text/plain; charset=ISO-8859-15
Content-ID: <nycvar.YSQ.7.78.906.2010051709171.2184@knanqh.ubzr>
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Oct 2020, Sakari Ailus wrote:

> Hi Nicolas,

Hello Sakari,

Thanks for your review.

> Thanks for the patchset. It's a big patch... it might be easier to get
> reviews by splitting it. Feel free to do that if it's not too hard.

This is hard.  The only thing that I could split out without too much=20
pain that still can be tested is the DMA support. And there is no=20
bisectability advantage in doing so either.

> Please see my comments below.
>=20
> On Tue, Aug 18, 2020 at 11:17:23PM -0400, Nicolas Pitre wrote:
> > From: Nicolas Pitre <npitre@baylibre.com>
> > +/* Data Transfer Speed and Mode */
> > +enum hci_cmd_mode {
> > +	MODE_I3C_SDR0		=3D 0x0,
> > +	MODE_I3C_SDR1		=3D 0x1,
> > +	MODE_I3C_SDR2		=3D 0x2,
> > +	MODE_I3C_SDR3		=3D 0x3,
> > +	MODE_I3C_SDR4		=3D 0x4,
> > +	MODE_I3C_HDR_TSx	=3D 0x5,
> > +	MODE_I3C_HDR_DDR	=3D 0x6,
> > +	MODE_I3C_HDR_BT		=3D 0x7,
> > +	MODE_I3C_Fm_FmP		=3D 0x8,
> > +	MODE_I2C_Fm		=3D 0x0,
> > +	MODE_I2C_FmP		=3D 0x1,
> > +	MODE_I2C_UD1		=3D 0x2,
> > +	MODE_I2C_UD2		=3D 0x3,
> > +	MODE_I2C_UD3		=3D 0x4,
>=20
> I wonder if there's something else that separates I3C and I=B2C modes. =
Should
> the two be in a different enum?

There is only that I2C bit in the Device Address Table. Still, those=20
mode values are stored in the same register field so there is no real=20
advantage from splitting them.

> > +/* TID generation */
> > +#define hci_get_tid(bits) \
> > +	(atomic_inc_return_relaxed(&hci->next_cmd_tid) % (1 << (bits)))
>=20
> 1U. And you don't need a modulo here, simple bitwise and is more effici=
ent.

Good point about 1U. However the compiler is smart enough to convert the=20
modulus into a bitwise "and" in the generated assembly.

> > +/* Our various instances */
> > +extern const struct hci_cmd_ops i3c_hci_cmd_v1;
> > +extern const struct hci_cmd_ops i3c_hci_cmd_v2;
>=20
> As these are global symbols, I'd add a prefix such as "mipi_" to these.

Won't make a difference in the modular case... but fair enough.

> > +// SPDX-License-Identifier: BSD-3-Clause
>=20
> Please read Documentation/process/license-rules.rst . IOW, BSD 3-clause
> license alone is not one of the acceptable licenses. I also don't see a
> need for dual licensing.

Really?

I did read Documentation/process/license-rules.rst obviously.

Let's have a look again. From that document:

|The licenses currently used, as well as the licenses for code added to t=
he
|kernel, can be broken down into:
|
|1. _`Preferred licenses`:
|
|   Whenever possible these licenses should be used as they are known to =
be
|   fully compatible and widely used.  These licenses are available from =
the
|   directory::
|
|      LICENSES/preferred/
|
|   in the kernel source tree.

Incidentally, the file LICENSES/preferred/BSD-3-Clause can be found=20
there. And it contains:

|  To use the BSD 3-clause "New" or "Revised" License put the following S=
PDX
|  tag/value pair into a comment according to the placement guidelines in
|  the licensing rules documentation:
|    SPDX-License-Identifier: BSD-3-Clause

There is indeed a mention in license-rules.rst that suggests:=20
"individual files can be provided under a dual license, e.g. one of the=20
compatible GPL variants and alternatively under a permissive license=20
like BSD, MIT etc." It says *can* not *must*. In fact, there is a=20
section explicitly for licenses that may only be used in a dual-license=20
setup:

|3. Dual Licensing Only
|
|   These licenses should only be used to dual license code with another
|   license in addition to a preferred license.  These licenses are avail=
able
|   from the directory::
|
|      LICENSES/dual/
|
|   in the kernel source tree.

And no BSD license is to be found there.

If still in doubt, let's see what exists in practice:

$ git grep "SPDX-License-Identifier: BSD-3-Clause\($\| \*/\)" drivers/
drivers/crypto/talitos.h:/* SPDX-License-Identifier: BSD-3-Clause */
drivers/firmware/ti_sci.h:/* SPDX-License-Identifier: BSD-3-Clause */
drivers/net/dsa/sja1105/sja1105_clocking.c:// SPDX-License-Identifier: BS=
D-3-Clause
drivers/net/dsa/sja1105/sja1105_sgmii.h:/* SPDX-License-Identifier: BSD-3=
-Clause */
drivers/net/dsa/sja1105/sja1105_spi.c:// SPDX-License-Identifier: BSD-3-C=
lause
drivers/net/dsa/sja1105/sja1105_static_config.c:// SPDX-License-Identifie=
r: BSD-3-Clause
drivers/net/dsa/sja1105/sja1105_static_config.h:/* SPDX-License-Identifie=
r: BSD-3-Clause */
drivers/remoteproc/omap_remoteproc.h:/* SPDX-License-Identifier: BSD-3-Cl=
ause */
drivers/staging/greybus/audio_apbridgea.h:/* SPDX-License-Identifier: BSD=
-3-Clause */
drivers/staging/greybus/tools/lbtest:# SPDX-License-Identifier: BSD-3-Cla=
use
drivers/staging/greybus/tools/loopback_test.c:// SPDX-License-Identifier:=
 BSD-3-Clause
drivers/usb/serial/keyspan_usa26msg.h:/* SPDX-License-Identifier: BSD-3-C=
lause */
drivers/usb/serial/keyspan_usa28msg.h:/* SPDX-License-Identifier: BSD-3-C=
lause */
drivers/usb/serial/keyspan_usa49msg.h:/* SPDX-License-Identifier: BSD-3-C=
lause */
drivers/usb/serial/keyspan_usa67msg.h:/* SPDX-License-Identifier: BSD-3-C=
lause */
drivers/usb/serial/keyspan_usa90msg.h:/* SPDX-License-Identifier: BSD-3-C=
lause */

So there are couple precedents already.

> > +#define CMD_A0_TOC			           W0_BIT_(31)
> > +#define CMD_A0_ROC			           W0_BIT_(30)
>=20
> Please use tabs for alignment.

Fixed.

> > +#define CMD_I1_DATA_BYTE_4(v)		FIELD_PREP(W1_MASK(63, 56), v)
>=20
> I'm not sure W*_MASK() macros are helpful here. I'd just use plain
> FIELD_PREP() and BIT(). The digit after I in the macro name already sig=
nals
> the position.

Those macros are very helpful. The spec is written in terms of bit=20
numbers from 0 through 127. Manually converting those into the 32-bit=20
word that the hardware interface uses is error prone.

> > +#define CMD_M1_VENDOR_SPECIFIC		           W1_MASK(63, 32)
> > +#define CMD_M0_MIPI_RESERVED		           W0_MASK(31, 12)
> > +#define CMD_M0_MIPI_CMD			           W0_MASK(11, 8)
> > +#define CMD_M0_VENDOR_INFO_PRESENT	           W0_BIT_(7)
> > +#define CMD_M0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
>=20
> Please align the macro expansions.

OK.

> > +static int hci_cmd_v1_prep_ccc(struct i3c_hci *hci,
> > +			       struct hci_xfer *xfer,
> > +			       u8 ccc_addr, u8 ccc_cmd, bool raw)
> > +{
> > +	u_int dat_idx =3D 0;
>=20
> Please use unsigned int instead. Same elsewhere.

Why?

> > +	int mode =3D hci_get_i3c_mode(hci);
>=20
> This returns an enum. Why int here?

Good point.

> > +	u8 *data =3D xfer->data;
> > +	u_int data_len =3D xfer->data_len;
> > +	bool rnw =3D xfer->rnw;
> > +	int ret;
> > +
> > +	BUG_ON(raw);
>=20
> Uh-oh. I think you really should return an error code instead. Also
> consider WARN_ON().

As mentioned previously, this may happen only if the code is buggy and=20
should be caught right away. But I'm gaving in on this one.

> > +	xfer->cmd_tid =3D hci_get_tid(4);
>=20
> Why 4 and e.g. not 7? A macro with a descriptive name would be nice.

The macro is:

#define hci_get_tid(bits)

but yeah... it could be in the macro name as well.

In fact, there is no longer 3-bits TID fields. They're all 4-bits wide=20
now. So I simply removed the macro argument instead.

> > +		xfer->cmd_desc[1] =3D 0;
> > +		switch (data_len) {
> > +		case 4:
> > +			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_4(data[3]);
> > +			fallthrough;
> > +		case 3:
> > +			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_3(data[2]);
> > +			fallthrough;
> > +		case 2:
> > +			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_2(data[1]);
> > +			fallthrough;
> > +		case 1:
> > +			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_1(data[0]);
> > +			fallthrough;
> > +		case 0:
> > +			break;
> > +		}
>=20
> I see the same pattern being repeated elsewhere. Could you move it into=
 a
> function and call that here?

Indeed, good point.

> > +		DBG("next_addr =3D 0x%02x, DAA using DAT %d", next_addr, dat_idx);
>=20
> dev_dbg() perhaps? Same elsewhere.

Nah... Given all the needed arguments and the function name prefix I=20
want, the dev_dbg() ended up spanning 3 lines whereas the DBG() wrapper=20
takes only one in most cases.

> > +	}
> > +
> > +	if (dat_idx >=3D 0)
> > +		i3c_hci_dat_free_entry(hci, dat_idx);
> > +	hci_free_xfer(xfer, 1);
>=20
> A newline before a lone return would be nice.
>=20
> > +	return ret;

What do you mean? It is part of the cleanup and exit block which doesn't=20
make it lone anyway.

> > +static int i3c_hci_bus_init(struct i3c_master_controller *m)
> > +{
> > +	struct i3c_hci *hci =3D to_i3c_hci(m);
> > +	struct i3c_device_info info;
> > +	int ret;
> > +
> > +	DBG("");
>=20
> Really?

Sure!

> > +#if 0
> > +	if (ccc->rnw) {
> > +		HEXDUMP("got: ", ccc->dests[0].payload.data,
> > +				 ccc->dests[0].payload.len);
> > +	}
>=20
> This should probably be removed.

Well, after Boris's suggestion, I turned it into this:

	if (ccc->rnw)
		DBG("got: %*ph",
			ccc->dests[0].payload.len, ccc->dests[0].payload.data);

But yes, this should go eventually. Not yet though.

> > +	size_limit =3D 1 << (16 + FIELD_GET(HC_CAP_MAX_DATA_LENGTH, hci->ca=
ps));
>=20
> 1U

ACK.

> > +		xfer[i].rnw =3D (i2c_xfers[i].flags & I2C_M_RD);
>=20
> No need for parentheses.

Right.

> > +	/* Validate HCI hardware version */
> > +	regval =3D reg_read(HCI_VERSION);
> > +	hci->version_major =3D (regval >> 8) & 0xf;
> > +	hci->version_minor =3D (regval >> 4) & 0xf;
> > +	hci->revision =3D regval & 0xf;
> > +	NOTE("HCI v%u.%u r%02u",
> > +	     hci->version_major, hci->version_minor, hci->revision);
>=20
> dev_info()?

Same argument as for DBG().

> You might also want to say which HCI it is.

Good point.

> > +		ERR("unsupported HCI version");
>=20
> dev_err().

Ditto.

> > +		return -EPROTONOSUPPORT;
>=20
> I'd just use -EINVAL.

-EINVAL is widely used already. Let's try to report more precise errors=20
when we can.

> > +int i3c_hci_dat_init(struct i3c_hci *hci)
>=20
> Please add some descriptive prefix for the new global symbols.

Right. Moved those into object methods anyway.

> > +	for (dat_idx =3D find_first_bit(hci->DAT_data, hci->DAT_entries);
> > +	     dat_idx < hci->DAT_entries;
> > +	     dat_idx =3D find_next_bit(hci->DAT_data, hci->DAT_entries, dat=
_idx)) {
> > +		dat_w0 =3D dat_w0_read(dat_idx);
> > +		if (FIELD_GET(DAT_0_DYNAMIC_ADDRESS, dat_w0) =3D=3D dev_addr)
> > +			return dat_idx;
> > +	}
> > +	/* what to do here? */
> > +	BUG();
>=20
> Ouch. How about returning a negative error code?

Indeed.

> > + * Paul Kimelman's debug trace log facility.
> > + * This is completely vendor and hardware specific.
>=20
> As useful this may have been for debugging while working with the drive=
r
> implementation, I don't think it should be part of the MIPI I3C HCI dri=
ver.

Agreed. It won't be part of the next post.

> > +#define VENDOR_CAP_ENTRIES ARRAY_SIZE(vendor_ext_caps)
>=20
> Please just use ARRAY_SIZE() where you need it.

OK.

> > +	if (pio->curr_tx &&
> > +	    pio->curr_tx->data_left !=3D pio->curr_tx->data_len)
>=20
> Fits on a single line.

Indeed.


Nicolas
--8323328-744515117-1601931621=:2184
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--8323328-744515117-1601931621=:2184--

