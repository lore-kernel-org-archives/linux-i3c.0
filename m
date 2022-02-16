Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9119C433EF
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Feb 2022 19:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8qWzT9Q+BJMk1TAbasoO+XVEyvmCRHnvYYTFA/Hkp6A=; b=R1M/1Qj6NyBAzO
	e0FOYC2jUlL/SA+D184UPY1vRmyFBtcZvc3Zm1cMcyABfgCs0AQd4nWKEP1tRfzRxDTita94svDgM
	7v8mXU5a9VketbOQE9nuneSKtdVeg9m/WSjbO61mZz6Vtn/B4qygUG9cBteZ3pr7MTqri0nkNauwc
	xDIXsZYQhQR4NyMJ7aOQ+QDl9Ki4Ru3DixO7lVVJI7ETPBgsUcXzCVG+56cvfVvoMDQlsl6I5Ltqo
	veHUJ+53RY+h8JwL7drMAmnUocUypzY8JdMrvzxEvCvooYit3IJaQ50xRjoTzMAAwwLatvEX76wYH
	nDofUdhy4+saJvaAlWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKPko-008CIL-4k; Wed, 16 Feb 2022 19:14:18 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKPkb-008CGh-Fr; Wed, 16 Feb 2022 19:14:06 +0000
Received: by mail-oo1-f49.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so3623797ooi.7; 
 Wed, 16 Feb 2022 11:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLrFIsE9bo3p9BnVIL7Uc7sprqnSKm0YOW7fBIQdERM=;
 b=NqujhlmTu/97vFdAydetOg9u5IhJ7FtSPusbknQYUXYVKh/Gqs/am7Wv/QgLfALzoV
 rSE0WZp3hwcGqIziNSuO5luhCGgP5Wh8GdCYx+ZfEtcIL/k5kq3Kj6/JttFQ1PXZNUxG
 MGwQyb+UVCZtm/D+RnbcRVh7JeFCJ9bcf092StNoMtbXBUwzLxiJODD6TcDAfcIwGZ9J
 6Ki0T2frbZQ+fIFWZzcPrgX0hk/kxyy1U+yMTPAl/GEwvameLgJV9UXMaE+2YndbK00t
 FUrmHqAw7icPXXmnY2aio5twwPQ0WABbW+06ci9Ber/soDGoIscLNtY4nRAu7mHYK/jm
 Oncg==
X-Gm-Message-State: AOAM531fWPtNE+JSBh+Zhc3wJAYvBtmHDxL46g+mOUdBX953O5r+85pQ
 08mmbnyVzl7DA1AUHbJ1ryaUSewhEJpzgQMWNlbmOYhKsqOJrg==
X-Google-Smtp-Source: ABdhPJyFOmiGOmRDkw8czUhuWEAUWZI3b6hfKAcdDSxdtm3oSTgs7z2noREt7vOvPl7JarLhxJEUxltkCz2WrL99cSU=
X-Received: by 2002:a0d:c244:0:b0:2d1:1fbb:180d with SMTP id
 e65-20020a0dc244000000b002d11fbb180dmr3902361ywd.196.1645038358332; Wed, 16
 Feb 2022 11:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor> <Ygv8wY75hNqS7zO6@unreal>
 <20220215193221.GA884407@embeddedor>
In-Reply-To: <20220215193221.GA884407@embeddedor>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 16 Feb 2022 20:05:47 +0100
Message-ID: <CAJZ5v0jpAnQk+Hub6ue6t712RW+W0YBjb_gAcZZbUeuYMGv7mg@mail.gmail.com>
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays with
 flexible-array members
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Kees Cook <keescook@chromium.org>, 
 GR-QLogic-Storage-Upstream@marvell.com, linux-alpha@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-ia64@vger.kernel.org, 
 linux-s390@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>, 
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
 linux-xtensa@linux-xtensa.org, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, 
 coresight@lists.linaro.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 netdev <netdev@vger.kernel.org>, 
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>, 
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 target-devel@vger.kernel.org, 
 mpi3mr-linuxdrv.pdl@broadcom.com, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, sparmaintainer@unisys.com, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 Ext4 Developers List <linux-ext4@vger.kernel.org>, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
 "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>, greybus-dev@lists.linaro.org,
 linux-i3c@lists.infradead.org, linux-rdma@vger.kernel.org, 
 "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, 
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_111405_579361_CA6F31B2 
X-CRM114-Status: GOOD (  15.55  )
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

On Tue, Feb 15, 2022 at 8:24 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> On Tue, Feb 15, 2022 at 09:19:29PM +0200, Leon Romanovsky wrote:
> > On Tue, Feb 15, 2022 at 01:21:10PM -0600, Gustavo A. R. Silva wrote:
> > > On Tue, Feb 15, 2022 at 10:17:40AM -0800, Kees Cook wrote:
> > > > On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> > > >
> > > > These all look trivially correct to me. Only two didn't have the end of
> > > > the struct visible in the patch, and checking those showed them to be
> > > > trailing members as well, so:
> > > >
> > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > >
> > > I'll add this to my -next tree.
> >
> > I would like to ask you to send mlx5 patch separately to netdev. We are working
> > to delete that file completely and prefer to avoid from unnecessary merge conflicts.
>
> Oh OK. Sure thing; I will do so.

Can you also send the ACPI patch separately, please?

We would like to route it through the upstream ACPICA code base.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
