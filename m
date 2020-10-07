Return-Path: <SRS0=zTQb=DO=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E85C41604
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Oct 2020 16:31:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DCD12064E
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Oct 2020 16:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fchTRaxk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="LF29k0Ky";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="R1SP+i8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DCD12064E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fexXWCA+cjLNh8UaF2OSBK8EYkFFWd6jPQNcEW0LPx8=; b=fchTRaxk3ncTgnD+cYBmS0ulW
	zRZgZ19jTUW3srm93+UROGHWZSVU01p5BOSW+qZFN1zvwFFJmZe8/WPnsIQFOka81t7OA7m95reIe
	HMJW2w04dCV0k7qIjF1psY72whBmXEQUA0fdw7rWrQbb8/U3vwNwPDX7IPHttqlQaqA6ocKXutSzw
	tHYQNmGBP5xMVV5KYt1eMemKHNjPa/MBB9OxOuXu695hKYtUhWBaQ9ls7bapg96np7/CHdH5+YZ5J
	wDBeQF/Gn5P0bmuGEMViWCTrngi4KUxs/UO4jN3RgZZ+tYC9G5QRFwVUqAThIblhdup1aiQ0QsKX5
	BN6xH6PKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQCLP-0007Zv-Gj; Wed, 07 Oct 2020 16:31:11 +0000
Received: from pb-smtp20.pobox.com ([173.228.157.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQCLN-0007ZM-Hj
 for linux-i3c@lists.infradead.org; Wed, 07 Oct 2020 16:31:10 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id D6C97ECE41;
 Wed,  7 Oct 2020 12:31:04 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=24A8DgbNvTwbPdWal2KAkgRrCks=; b=LF29k0
 KySauM+WXIEgp5uTTsi5pdq+WIAoFxkd4zxXwCJ4S1uWMhBk5XYrZOhjo2jTucC9
 8EMMNvAucK0gki1lqNzKhSiwsbLiRpZu0SNjVr45zoghUxHL2dl4LBvFFh3C1qrS
 l3smZo7wlS6+fh9ht3r83wl0CDIXUzNIeN7i0=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id CDBF3ECE40;
 Wed,  7 Oct 2020 12:31:04 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=KvHMjsdQuvWbgCpaazZGlXwge+JKOnzIpcwf6PQG46k=;
 b=R1SP+i8gpqYSNPM9grt/yt+wzgbJTFOKnjzQhXINX5Bf5bUjdbWzJOpvudC+sbeP7/LxMzCin2cGqdC1qhPTNOJWi2RSTwuzcMIdL4MqLoJ+/p0/l6+jcD4SnIRi2UiBZUtO6DGlNsVhIirDTFleM6YfL5mkazXZSgYylAKEkcE=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id A7BDEECE34;
 Wed,  7 Oct 2020 12:31:01 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id C9E1E2DA0A99;
 Wed,  7 Oct 2020 12:30:59 -0400 (EDT)
Date: Wed, 7 Oct 2020 12:30:59 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 2/2] i3c/master: add the mipi-i3c-hci driver
In-Reply-To: <20201007101718.GA6413@valkosipuli.retiisi.org.uk>
Message-ID: <nycvar.YSQ.7.78.906.2010071129120.2184@knanqh.ubzr>
References: <20200819031723.1398378-1-nico@fluxnic.net>
 <20200819031723.1398378-3-nico@fluxnic.net>
 <20201001123103.GJ2024@valkosipuli.retiisi.org.uk>
 <nycvar.YSQ.7.78.906.2010051528570.2184@knanqh.ubzr>
 <20201007101718.GA6413@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
X-Pobox-Relay-ID: 7CE19F34-08BA-11EB-90BB-E43E2BB96649-78420484!pb-smtp20.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_123109_863228_844FD536 
X-CRM114-Status: GOOD (  39.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 7 Oct 2020, Sakari Ailus wrote:

> Hi Nicolas,
> 
> On Mon, Oct 05, 2020 at 06:15:59PM -0400, Nicolas Pitre wrote:
> > On Thu, 1 Oct 2020, Sakari Ailus wrote:
> > > On Tue, Aug 18, 2020 at 11:17:23PM -0400, Nicolas Pitre wrote:
> > > > +	(atomic_inc_return_relaxed(&hci->next_cmd_tid) % (1 << (bits)))
> > > 
> > > 1U. And you don't need a modulo here, simple bitwise and is more efficient.
> > 
> > Good point about 1U. However the compiler is smart enough to convert the 
> > modulus into a bitwise "and" in the generated assembly.
> 
> I guess it depends on the compiler.

Not really. All gcc versions in the last 20 years did it. llvm always 
did it too. That's a trivial optimization that all serious compilers 
implement.

> Still the result of shifting 1 to the
> signed bit is not defined. It might not happen in this driver but using
> unsigned value there is a good practice.

Agreed.

> > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > 
> > > Please read Documentation/process/license-rules.rst . IOW, BSD 3-clause
> > > license alone is not one of the acceptable licenses. I also don't see a
> > > need for dual licensing.
> > 
> > Really?
> > 
> > I did read Documentation/process/license-rules.rst obviously.
> > 
> > Let's have a look again. From that document:
> > 
> > |The licenses currently used, as well as the licenses for code added to the
> > |kernel, can be broken down into:
> > |
> > |1. _`Preferred licenses`:
> > |
> > |   Whenever possible these licenses should be used as they are known to be
> > |   fully compatible and widely used.  These licenses are available from the
> > |   directory::
> > |
> > |      LICENSES/preferred/
> > |
> > |   in the kernel source tree.
> > 
> > Incidentally, the file LICENSES/preferred/BSD-3-Clause can be found 
> > there. And it contains:
> > 
> > |  To use the BSD 3-clause "New" or "Revised" License put the following SPDX
> > |  tag/value pair into a comment according to the placement guidelines in
> > |  the licensing rules documentation:
> > |    SPDX-License-Identifier: BSD-3-Clause
> > 
> > There is indeed a mention in license-rules.rst that suggests: 
> > "individual files can be provided under a dual license, e.g. one of the 
> > compatible GPL variants and alternatively under a permissive license 
> > like BSD, MIT etc." It says *can* not *must*. In fact, there is a 
> > section explicitly for licenses that may only be used in a dual-license 
> > setup:
> > 
> > |3. Dual Licensing Only
> > |
> > |   These licenses should only be used to dual license code with another
> > |   license in addition to a preferred license.  These licenses are available
> > |   from the directory::
> > |
> > |      LICENSES/dual/
> > |
> > |   in the kernel source tree.
> > 
> > And no BSD license is to be found there.
> > 
> > If still in doubt, let's see what exists in practice:
> > 
> > $ git grep "SPDX-License-Identifier: BSD-3-Clause\($\| \*/\)" drivers/
> > drivers/crypto/talitos.h:/* SPDX-License-Identifier: BSD-3-Clause */
> > drivers/firmware/ti_sci.h:/* SPDX-License-Identifier: BSD-3-Clause */
> > drivers/net/dsa/sja1105/sja1105_clocking.c:// SPDX-License-Identifier: BSD-3-Clause
> > drivers/net/dsa/sja1105/sja1105_sgmii.h:/* SPDX-License-Identifier: BSD-3-Clause */
> > drivers/net/dsa/sja1105/sja1105_spi.c:// SPDX-License-Identifier: BSD-3-Clause
> > drivers/net/dsa/sja1105/sja1105_static_config.c:// SPDX-License-Identifier: BSD-3-Clause
> > drivers/net/dsa/sja1105/sja1105_static_config.h:/* SPDX-License-Identifier: BSD-3-Clause */
> > drivers/remoteproc/omap_remoteproc.h:/* SPDX-License-Identifier: BSD-3-Clause */
> > drivers/staging/greybus/audio_apbridgea.h:/* SPDX-License-Identifier: BSD-3-Clause */
> > drivers/staging/greybus/tools/lbtest:# SPDX-License-Identifier: BSD-3-Clause
> > drivers/staging/greybus/tools/loopback_test.c:// SPDX-License-Identifier: BSD-3-Clause
> > drivers/usb/serial/keyspan_usa26msg.h:/* SPDX-License-Identifier: BSD-3-Clause */
> > drivers/usb/serial/keyspan_usa28msg.h:/* SPDX-License-Identifier: BSD-3-Clause */
> > drivers/usb/serial/keyspan_usa49msg.h:/* SPDX-License-Identifier: BSD-3-Clause */
> > drivers/usb/serial/keyspan_usa67msg.h:/* SPDX-License-Identifier: BSD-3-Clause */
> > drivers/usb/serial/keyspan_usa90msg.h:/* SPDX-License-Identifier: BSD-3-Clause */
> > 
> > So there are couple precedents already.
> 
> These look more like accidents rather than informed decisions to merge
> BSD-only licensed code. I'd still say no.

BSD-only licensed code _is_ OK per the rules clearly and 
unambiguously quoted above. It's not a matter of opinion.

That is the license to be used per the policy from the organisation 
sponsoring this work. This even had to go through legal approval before 
I was allowed to post this code here.

So if you don't like BSD being OK then please submit a patch changing 
the rules. If accepted upstream then I'll see for this code to be 
dual-licensed or even made GPL only so to conform to the new rules. 
Otherwise BSD-licensed it stays.

> > > Please use unsigned int instead. Same elsewhere.
> > 
> > Why?
> 
> Because nobody else uses it and it expands to a standard type anyway. The
> comment in types.h suggests it comes from BSDs. So there's no reason to use
> it in new kernel code.

OK then. I'll grant you that strike against BSD.  ;-)

> > > > +		DBG("next_addr = 0x%02x, DAA using DAT %d", next_addr, dat_idx);
> > > 
> > > dev_dbg() perhaps? Same elsewhere.
> > 
> > Nah... Given all the needed arguments and the function name prefix I 
> > want, the dev_dbg() ended up spanning 3 lines whereas the DBG() wrapper 
> > takes only one in most cases.
> 
> Possibly so, but creating your own debug infrastructure where it already
> exists does not look like a great idea.

It's not a debug _infrastructure_. Not even a new one. It is merely a 
convenience wrapper on top of the existing infrastructure that I can 
redefine to whatever suits me best when working on this code, which 
incidentally means _not_ using dev_dbg().

> For instance, the DBG macro does not use the device whereas the rest 
> assume that hci is your host controller struct pointer.

And that's very much on purpose to keep my debug lines shorter.

> If nothing else, it's simply ugly.

Your opinion. Obviously I disagree.

As a compromise I'll remove the other wrappers whose definition is 
unlikely to change.


Nicolas

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
