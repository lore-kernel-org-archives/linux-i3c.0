Return-Path: <SRS0=WMlw=BZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F372C433E1
	for <linux-i3c@archiver.kernel.org>; Sat, 15 Aug 2020 09:18:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B8462310B
	for <linux-i3c@archiver.kernel.org>; Sat, 15 Aug 2020 09:18:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DQsOKzZ8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmkbNPlx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B8462310B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zepv507el5RSy9GNe9b56Xyi1ad6FtWN4F2wkKtq7/8=; b=DQsOKzZ8tzQta1BRNdvBaIcQ5
	Ia7C2fa2ZAExpTx8LvM8zb10fT4BnGjro7znW/VKLvFOHWFOVoqmktVUhASoTMIGno3bgpT+s2C7Q
	EY98FpSImlukBPX20H8RAu4T4uyHl7aPlC0Qpd1/O2tMGaUxYdJRMSzVe3pVYWtLeIq3eFEbmhhHK
	Lds9B8kdt8m3jesz1pbE/vxeVbqvNRriy8wqfhU6ls/xeTjfeCP0srodyLyI1XQIzoO9Iu5jVdKgC
	JNE1j6BH1Ul6IMiDAuedGJ88LYFkPeqnoml1rxVciyzmBESNvcnfkiWV/VJR4HFQwcQHsuxwe7N6k
	qEAG0ILJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6sKX-0005Ck-QR
	for linux-i3c@archiver.kernel.org; Sat, 15 Aug 2020 09:18:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6e6k-0004yf-Ix
 for linux-i3c@lists.infradead.org; Fri, 14 Aug 2020 18:07:15 +0000
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E03B920855
 for <linux-i3c@lists.infradead.org>; Fri, 14 Aug 2020 18:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597428433;
 bh=NFHdc3BmdYFhz2nyKu8dvV6vT2C/XFArO5mCzwNmMDQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LmkbNPlxnz2KVY3YlDjhBA55pnVQFQlSw1VT7g0JJYThgl0KHUNHxqblsQSxuMVTm
 jQMNdT6F/fnJKUXTo6gn145yoYAsEM/zEEB+OQ3/yxmIlo52Wve+fWHgBaZcC+PWCz
 t0rGc6tECvGfbLPtQXACIs5iWdo5G9wjTap3p0qw=
Received: by mail-oo1-f48.google.com with SMTP id g18so2099232ooa.0
 for <linux-i3c@lists.infradead.org>; Fri, 14 Aug 2020 11:07:12 -0700 (PDT)
X-Gm-Message-State: AOAM531crgcHPZzqEp29TBTwoe1phQ0byKx4yojfeI36gCIKLtN7zpBn
 Xm7XVhDKqa8l/DSIKIGi7jMipDxtR/6wz2SBrg==
X-Google-Smtp-Source: ABdhPJxmP2s5JfYVm3WEANrKwTUJbyRcbOd7ARe5undwm96kyX2D2gaV83wWWuqAjTXDbKGMvwTgDcWr+VmwZhsA9hE=
X-Received: by 2002:a4a:330b:: with SMTP id q11mr2519520ooq.50.1597428432155; 
 Fri, 14 Aug 2020 11:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200814034854.460830-1-nico@fluxnic.net>
 <20200814034854.460830-2-nico@fluxnic.net>
In-Reply-To: <20200814034854.460830-2-nico@fluxnic.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 14 Aug 2020 12:07:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKTJgo8y1Zq=tyM=tTCXaVdu9o09SBiMNdz-OtXOMkkgg@mail.gmail.com>
Message-ID: <CAL_JsqKTJgo8y1Zq=tyM=tTCXaVdu9o09SBiMNdz-OtXOMkkgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: MIPI I3C Host Controller Interface
To: Nicolas Pitre <nico@fluxnic.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_140714_711168_793D8778 
X-CRM114-Status: GOOD (  19.72  )
X-Mailman-Approved-At: Sat, 15 Aug 2020 05:18:24 -0400
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
 Laura Nixon <laura.nixon@team.mipi.org>, Nicolas Pitre <npitre@baylibre.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Matthew Schnoor <matthew.schnoor@intel.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Aug 13, 2020 at 9:49 PM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> From: Nicolas Pitre <npitre@baylibre.com>
>
> The MIPI I3C HCI (Host Controller Interface) specification defines
> a common software driver interface to support compliant MIPI I3C
> host controller hardware implementations from multiple vendors.
>
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
>  .../devicetree/bindings/i3c/mipi-i3c-hci.txt      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.txt

Bindings should be in schema format now.

> diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.txt b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.txt
> new file mode 100644
> index 0000000000..8de7d7ac6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.txt
> @@ -0,0 +1,15 @@
> +MIPI I3C Host Controller Interface
> +----------------------------------
> +
> +Required properties:
> +- compatible : "mipi-i3c-hci"

A register interface (or protocol) spec is never complete enough to
capture all the details about a specific h/w implementation. One just
has to go look at AHCI, EHCI, OHCI, XHCI, UFS, 8250, etc. bindings.
Let's not start with pretending that here. Fine for this to be a
fallback, but it must have a compatible for a specific implementation.

Also, which version of the spec does this compatible correspond to? Or
are there not HCI differences in the spec versions you mention in the
cover letter?

> +- reg : Should contain 1 register range (address and length)
> +- interrupts : HCI interrupt
> +
> +Example:
> +
> +       mipi_i3c_hci@0xa0000000 {

i3c@a0000000


> +               compatible = "mipi-i3c-hci";
> +               reg = <0xa0000000 0x2000>;
> +               interrupts = <89>;
> +       };
> --
> 2.26.2
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
