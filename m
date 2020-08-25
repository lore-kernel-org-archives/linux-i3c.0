Return-Path: <SRS0=OcUj=CD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7483EC433E3
	for <linux-i3c@archiver.kernel.org>; Tue, 25 Aug 2020 23:06:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41F6520738
	for <linux-i3c@archiver.kernel.org>; Tue, 25 Aug 2020 23:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y59P4gbT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rl31BktP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F6520738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K4UxnMJZ6cGbcd4BbOvI/OkIM9qeLPhn+KvyB2tJQug=; b=Y59P4gbTXdyUR9P6sc/873yUG
	3eLx2+ceW9ybBu6g1C5Sc9y9uHtYInTNrJys1fMA2DMJAaDBeQa3lLAQdJ7MrU4Pochjxqxy/DvSE
	UIA6xlt5T9FLCfPuaFt4nv7AYgSe79YTg1PyqnhZFOVsmSpRr2IdEvHRd7wwMgqMrFDlkysYlo+dz
	bE+LndAMW0J5160lrj5JlfSAiaQ83UJsfLBKTDTgnc9IkS6IvT2w4p7q9wlVGi1hxGV6nGy2B98d4
	2zapD3JijufgEpSrl6tRjERSlx2ZKzQ6VyJNiAARVOyIXD+0k0U+9qaXVdq8R5DTFVLC5LJufSZWo
	PndpqYB3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAi1O-0008Qt-Va
	for linux-i3c@archiver.kernel.org; Tue, 25 Aug 2020 23:06:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAi1L-0008QI-Sc
 for linux-i3c@lists.infradead.org; Tue, 25 Aug 2020 23:06:29 +0000
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C25312075E
 for <linux-i3c@lists.infradead.org>; Tue, 25 Aug 2020 23:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598396786;
 bh=BHBom7uvQSruolWt1yr7oEcBpf4ZoT7u4+Gfmz9pZC0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rl31BktPtqc3PWxHB+IIBGgJqmnrWxrjOoHNAgNuUeiVLRDXQqRTBXoaJbZX7cPUb
 1p49hnza/6bXCuxRHh9IfepucG9u6UKqs42WcsiCwGYC47fhyGAGUUl3D99UqYr07j
 9f6Qyw6DRpQLqqvxL5Xl7KAUv3b9Rcns+jUWYlZA=
Received: by mail-oi1-f180.google.com with SMTP id u24so280256oic.7
 for <linux-i3c@lists.infradead.org>; Tue, 25 Aug 2020 16:06:26 -0700 (PDT)
X-Gm-Message-State: AOAM531UvgIx8pvqzcnd0lEMUNg6r4lSIqQAfSU7TuS3TVEiqx9dTE3e
 8J/PtWPZZDb4KQ2RvxHvYzUMcRHOygqkBJWMEg==
X-Google-Smtp-Source: ABdhPJx6ZzfXVbElsfjZylrjU/5tyZhCP29bjYFSeWpzKqBiEa5vShND8XRZ6vtTEADkiWj3LiEbQDEFJBqnwj2QCUw=
X-Received: by 2002:aca:e1d6:: with SMTP id y205mr2436807oig.152.1598396786162; 
 Tue, 25 Aug 2020 16:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200819031723.1398378-1-nico@fluxnic.net>
 <20200819031723.1398378-2-nico@fluxnic.net>
 <20200825212932.GA1360264@bogus>
 <nycvar.YSQ.7.78.906.2008251732430.1479@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.78.906.2008251732430.1479@knanqh.ubzr>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Aug 2020 17:06:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKJByNNwgP34_=G3bdVaZiM1OCUY94N1pTRzgNvqHjcWw@mail.gmail.com>
Message-ID: <CAL_JsqKJByNNwgP34_=G3bdVaZiM1OCUY94N1pTRzgNvqHjcWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: MIPI I3C Host Controller
 Interface
To: Nicolas Pitre <nico@fluxnic.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_190628_150779_8123EB22 
X-CRM114-Status: GOOD (  33.26  )
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
Cc: devicetree@vger.kernel.org, Robert Gough <robert.gough@intel.com>,
 Laura Nixon <laura.nixon@team.mipi.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Matthew Schnoor <matthew.schnoor@intel.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Aug 25, 2020 at 4:02 PM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Tue, 25 Aug 2020, Rob Herring wrote:
>
> > On Tue, Aug 18, 2020 at 11:17:22PM -0400, Nicolas Pitre wrote:
> > > From: Nicolas Pitre <npitre@baylibre.com>
> > >
> > > The MIPI I3C HCI (Host Controller Interface) specification defines
> > > a common software driver interface to support compliant MIPI I3C
> > > host controller hardware implementations from multiple vendors.
> > >
> > > Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> > > ---
> > >  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 41 +++++++++++++++++++
> > >  1 file changed, 41 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> > > new file mode 100644
> > > index 0000000000..8fc18ea922
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> > > @@ -0,0 +1,41 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/i3c/mipi-i3c-hci.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: MIPI I3C HCI Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Nicolas Pitre <npitre@baylibre.com>
> > > +
> > > +description: |
> > > +  MIPI I3C Host Controller Interface
> > > +
> > > +  The MIPI I3C HCI (Host Controller Interface) specification defines
> > > +  a common software driver interface to support compliant MIPI I3C
> > > +  host controller hardware implementations from multiple vendors.
> > > +
> > > +  For details, please see:
> > > +  https://www.mipi.org/specifications/i3c-hci
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mipi-i3c-hci
> >
> > What about my comments on v1? Pasted again:
>
> Oops, sorry, I missed them.
>
> > A register interface (or protocol) spec is never complete enough to
> > capture all the details about a specific h/w implementation. One just
> > has to go look at AHCI, EHCI, OHCI, XHCI, UFS, 8250, etc. bindings.
> > Let's not start with pretending that here. Fine for this to be a
> > fallback, but it must have a compatible for a specific implementation.
>
> You might have to indulge me a bit as I don't
> understand what you're asking.
>
> Currently there are very few implementations. One of them lives in an
> FPGA and the example below is actually the DT entry I use for it. I'm
> guessing specific vendor implementations will have their own tweaks
> eventually, such as clock sources and whatnot.

Yes, exactly. And bugs too.

> But that is outside of
> the spec (actually the spec defines a register area for eventual vendor
> specific usage). But I have no visibility into that and of course the
> code has no provision for that yet either.
>
> So I imagine there will be something like this in dts files eventually:
>
>         compatibvle = "intel,foobar_soc_i3c_hci", "mipi-i3c-hci";
>
> Is that what you mean?

Yes. Even your FPGA is tied to some implementation...

> > Also, which version of the spec does this compatible correspond to?
>
> All of them.
>
> > Or are there not HCI differences in the spec versions you mention in
> > the cover letter?
>
> The hardware is self advertising per the spec. So there is no need to
> carry such distinction in the DT compatible. Even vendor extensions are
> tagged with MIPI vendor IDs in the hardware directly.

Oh good, folks are learning. :)

Is the vendor ID (and revision) discoverable even if no vendor
extensions? If so, then I'm more comfortable with "mipi-i3c-hci" on
it's own. The exception will be if there's setup needed to discover
the h/w which seems likely. In that case, we should probably do
compatible strings based on VID/PID like PCI, USB, etc. No need to
define that now I guess, but please add some sort of summary of the
above about the discoverability of the HCI implementer and features.

Rob

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
