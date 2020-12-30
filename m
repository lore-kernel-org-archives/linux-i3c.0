Return-Path: <SRS0=dXGV=GD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF14C433E0
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Dec 2020 17:38:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 145FD223E0
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Dec 2020 17:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 145FD223E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NSR8mwWvEG+okko4jBpSJoekif0XQFcD82B9PsZKxWU=; b=sYY2ojOgmjeXWVr0Adp9nJUZQ
	CgOXbveOKdrLlFmrdl/YyjMbHrP06lqJ8wpLUEErvcKmS3ETKmJuchJdnWRNVk+b2+JqFlHe74anZ
	LhN2eYhMiJBPTo0UWn5taSZJTcKn7iCJNrtEzY5nuHUQWoUzcKUihhrBnX15+KC/wc7s7TIv8nEZz
	wovTEBSd0XY0mRYxBx7iwuN08dWvP6goZKu9RDqntQuZZA7mRGrs3nOWfq8wMB61eZj5q+DOyGTVD
	hFvky1viYDbunjftENjL5qF12fqvvl/KdPdhv3J1fGyqWevJY6twuo/hQ2EBY1DruaqUO23I14pNa
	e5xjFmx+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kv1tf-0005gj-A3; Thu, 31 Dec 2020 17:37:59 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kujFe-0004RO-LG
 for linux-i3c@lists.infradead.org; Wed, 30 Dec 2020 21:43:27 +0000
Received: by mail-qk1-x729.google.com with SMTP id p14so15057636qke.6
 for <linux-i3c@lists.infradead.org>; Wed, 30 Dec 2020 13:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MHAGjQt9ritApkqt6RGeoNtDT77YQoOVvjyTVHtT+3g=;
 b=gdhHhCOSKiJu9ssv21NlgVOZgjqGA7klsE/doI6LO95h1q147zlEf0ia1QPmCWpaOW
 WOwTMR6GFVbSJMxcm58ILD9HcSUynOYxTyYL3sdj7OQdqRPDZ2EtLsSjKlWd2DFrrwCb
 2kqLBKnRIYZWEd1wth0vzRC04GeyAgZxZ+vF6yByxfbzBzFNkmjwKrvQPkKYmPXWrPkk
 a4LDNiBGXkhg4Dju4Gf8EW0x7WLfmJxvQR04hZKKc9Y8o+xRz5GJhsBiiFCpm5SKz+oj
 BiHY47x1aXNW9xdoM/BYCxta7+phX38YY5BPX9sy3JxczaR7nK5p9se1J5J4UXpO9GHt
 z4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MHAGjQt9ritApkqt6RGeoNtDT77YQoOVvjyTVHtT+3g=;
 b=omA7CpTYmRLc5Ezl4UXQaZP7CWdGye78ZYTpffR6Ilq/AxcXN/Na9A2qAlRbiMePx/
 9DQmj4LXYzRLwvk3cvyenyLnoDyUpxTdvhIeYsCgcpu3BS9Uw2aWPrlCsIugUJt8jRed
 kuCO9iS4I3VhXfTz5DxvoN/zMjvf4muzf5mgK5RJJ896MSIx2lMXYPpSUqmHmkGZOS0A
 zNCQMq73djYFxuYxUsCxTY3/84Hw/2aSs9V+l6dwqWqEUbG1OQxTUyI4iMO/UTRGS3Sh
 3RdEwogBFOt6H+hyyUlWZTayOCz6wR1chn6As2mSQ6srta2dhwlRXCbzd8TjkvqTClcU
 Wc3g==
X-Gm-Message-State: AOAM531quKj/ik9RIXICqcpbIHdtK2hPxEddQ1nJE73N0PO2BMSrCgg8
 HRulWHElAVqM/WOgeiMuwqg=
X-Google-Smtp-Source: ABdhPJyuasQOd1EF0EG5fgz9yVihgXhzj3QGyamnG8i9FOy9owqSH4h7MwP048Iu4Y8EfYyf6hReUw==
X-Received: by 2002:a37:e108:: with SMTP id c8mr55768855qkm.305.1609364603815; 
 Wed, 30 Dec 2020 13:43:23 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id b15sm22343588qta.75.2020.12.30.13.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 13:43:23 -0800 (PST)
Date: Wed, 30 Dec 2020 14:43:21 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: re-fix __maybe_unused attribute
Message-ID: <20201230214321.GA1961980@ubuntu-m3-large-x86>
References: <20201230154304.598900-1-arnd@kernel.org>
 <orno9ppp-no44-4rp5-s6-58n46rsps045@onlyvoer.pbz>
 <20201230214053.GB110311@piout.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201230214053.GB110311@piout.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_164326_746722_245E45F5 
X-CRM114-Status: GOOD (  17.40  )
X-Mailman-Approved-At: Thu, 31 Dec 2020 12:37:57 -0500
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
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicolas Pitre <npitre@baylibre.com>, clang-built-linux@googlegroups.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Dec 30, 2020 at 10:40:53PM +0100, Alexandre Belloni wrote:
> On 30/12/2020 16:23:56-0500, Nicolas Pitre wrote:
> > On Wed, 30 Dec 2020, Arnd Bergmann wrote:
> > 
> > > From: Arnd Bergmann <arnd@arndb.de>
> > > 
> > > clang warns because the added __maybe_unused attribute is in
> > > the wrong place:
> > > 
> > > drivers/i3c/master/mipi-i3c-hci/core.c:780:21: error: attribute declaration must precede definition [-Werror,-Wignored-attributes]
> > > static const struct __maybe_unused of_device_id i3c_hci_of_match[] = {
> > >                     ^
> > > include/linux/compiler_attributes.h:267:56: note: expanded
> > > 
> > > Fixes: 95393f3e07ab ("i3c/master/mipi-i3c-hci: quiet maybe-unused variable warning")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > Acked-by: Nicolas Pitre <npitre@baylibre.com>
> > 
> > This might be the 3rd patch from 3 different people fixing the same 
> > thing. Looks like I3C maintainer is on vacation. Please feel free to 
> > send this trivial fix upstream some other way.
> > 
> 
> Isn't it already upstream?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=95393f3e07ab53855b91881692a4a5b52dcdc03c

This patch is fixing that one, the attribute was added between the
struct type, causing a new warning for clang.

I sent a fix for this earlier too, I do not care which one goes in as
long as one does so:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

Cheers,
Nathan

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
