Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AA5C982D7
	for <linux-i3c@archiver.kernel.org>; Fri, 18 Sep 2026 22:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIOn6BwzjzslLakHFX+nAutcxbw0QyFYRPE+ZHx9V88=; b=RxCRxpw4E1zQa4
	EhGHLKJgd0jDW49d/iDwQWx6r3Ddxba6IuiYtCTuR2h7tVWiIcIvHS6cmLokyUML5k7HwJIkwZ/qb
	HZeRzpyxzaoNhSFeEsZD+fDWoFf4IfuxzDNY/5Fb6KW1uQVtFQuV3Kqr3mi4uV71Tc/guikMeTYk7
	bJP4sBBR5wtjAS9a7+UwK4BvoKRzaZW4coi3XdZPSEs5WJbOxcmfXkxaw9Dh5qcThBRH7lGREDQfI
	o6qHXpxWC7Np6rxbdm6lQvolJVFVGTYZsnbNF6r9XmlEyX2fiB95HAgfaWloXf1ofKBh+q+lfEVnE
	8b2/NVJzzlVtP0OXVwRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hMe-0000000FfOO-233B;
	Fri, 18 Sep 2026 22:47:28 +0000
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hMc-0000000FfNm-2Iwu
	for linux-i3c@lists.infradead.org;
	Fri, 18 Sep 2026 22:47:27 +0000
Received: by mail-yx2-x0f.google.com with SMTP id 00721157ae682-895eaf30817so14157607b3.0
        for <linux-i3c@lists.infradead.org>; Fri, 18 Sep 2026 15:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789771644; cv=none;
        d=google.com; s=arc-20260327;
        b=ZjAoEuz5d4VxH6Ynnsjl3z+9MJX878pCIzVT6VysRpDuG4G/hmQ/agUsGlbkU6dBAA
         VUx6I6anol8P+aGzd2zt9/BIzDzRRo7Z5jHUoEGJgOBgADqGFfIBHlDh7zWHbJgPO2kV
         AQ9Otb693lsVncKLitI1wqI0KPu19dYuG/jIwUHEHrRFN4Po0e7YmDUZ4H7ft/dajpv5
         buQkS7yAC9lzUo28/7VYPc1WC2SSfLB4cpm6by2a72z5V5wa0+ANmb+BMw4RuLWdLjnr
         ren9ky1ne/+MOrB12OmjHpIaVAceZUnlMi0T+BjlS9O6C6P6IEAQW5L9ZaaH+vsVBJJJ
         dodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W2+7bjdeLJB5DriPRtjevhF7uljn15Vp87Hxw0lnlm8=;
        fh=A5pWKK+nf9vF5Bi3i1Ym6tdQvmG2NmeLe+sV/WVhclQ=;
        b=e+3k1oOaHj5JJG1OWmOcUd7mAi6zm7dzBCNpQS4Akt+Qz/1bkFBN64IYfcJixwfXgr
         JgbnonRLnWzX+pujEhAgGR3foz4cmamkbDCYcIBi6xovPPHs/CbgOiPQhjxV9IrjdCKz
         tooHQiod4ozv3W2rNid+HWKNIlH7mw5GHYfgFeoK7KOQE1CtgjVSd2Qa9noBeRudUJNk
         rDgQoeCtsAyLjteSCAl4NMu4V/DM6kc4oictQJJYpwNaZWR4GEPFm8jW6LfTgZu5NMwG
         QIjQWOpkWZe9TW9vHoS2MpWx85wHXDAiFyR51JDNPKH+PeWmLHJ0lsNLU5hJcBbcWGCg
         um7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771644; x=1790376444; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2+7bjdeLJB5DriPRtjevhF7uljn15Vp87Hxw0lnlm8=;
        b=eeRQGaSAqdOe8uFfFjtbY/tic+lAWzskf76eCpZ1GKGXwUrYsa4aqzEnwVoahI9N00
         hqEDeVLTOrymM4r3iV5JiB9TC9tCoGRlhanF9UePZlby9idAa3eS9iybmMu7CAZfKpbx
         uR6/f/ouRnXa81hO4GlnuH7e42X3t0S4O24M2SCFVc7YocE5dZu9aCE+/0qUCJS33AKc
         PWgwvTU106TWgrmb03pBtkP2WtZXc2Fyk2i3dpMEH3YRG/oVJHPOgkeC+y4fHKMhrfb2
         ZiL5y5x32HUs6fqiK3g3LDydYmpC5Orfta0f3As3iFtgDI0jZmv3My3rg8EttqHErx2Z
         s6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771644; x=1790376444;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W2+7bjdeLJB5DriPRtjevhF7uljn15Vp87Hxw0lnlm8=;
        b=zhOQkKEjs8azKsVv+BP/l3nFdxwk19FHNSTCWCO+LlNEyg876MqmwkV+Gzx4AY2P+Q
         Od4GwYCuje8FljsAdR3Ev5/2BQECmO6V0/btDuPcTAmDqjMalVFpmHl1Xj5BVruoaVgT
         BZbms+m+msfNOqG0boxfFbFga4GDViElMPngAfyVNpHYCHaRFEeHPskPE370ON/LVPGL
         agVnENL/tD91Mk4VVxH7DWZt0dLs+Bw1YoFnfFW3CwU1f3VkyLtSzAt19skU0tXKTjNJ
         s0pxr+l41IoChP24nyotTkowd6Yx2wdBsDuE9ZpdtAQWvmKQUK/eXqA9dgLv5fvOISra
         Lwaw==
X-Gm-Message-State: AFuF++kt/kuMNxWNF7gIQAd1mx3J4jgz5zC6ZMePlRFdOpq0urMEAp3C
	JrHpTjHItsdxoILFUO6lwpiQ0zEPlzmhNKaKcmWhyuwtSaHQqsZUP4ZKxZC8AmOm8HAXLyQqu/s
	uTlhLlae0qw0I5883zyH4al7pbjvEV03wmy8/d+/j
X-Gm-Gg: AYBFou2+3gFr+row2zB1AY3h147WGyo3crB9UiB+rGdP7ZwS3kf0pCs3i0kF9397+ly
	wpZYtbGTECJYTi5mJynP7BgOQMXQG3rsjxvsEwZaizi81O9QaDqtJDr86NLHoWxcNh3UXJJEH3H
	8QpIiK7tk2NwWrc0FBqkQubkwln+xVNYxX384JfswNrkigNCQBJQPFRUmg/+nD+xO1YXTy7rvYA
	yLEFKPV+AKvTYlI1KOG2S8h+sAy2AZd9biwJAyM+6lplnuKL3NfxwsyiaudPBMlDKBBkZ2V6I6i
	Axp5Pbrx8sG0Z1APypORDWeAeVQdNdlOwgG6z5fw4x86g5Z5A3j1rKwFWL9THfrpccC8ryiaO3N
	UlW1UOUMbvg==
X-Received: by 2002:a05:690c:10d:b0:873:5bd1:98ca with SMTP id
 00721157ae682-897383a138dmr12652817b3.60.1789771643744; Fri, 18 Sep 2026
 15:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <20260911-d0e2d97df458cbf24fa42089@linux.microsoft.com>
 <CAHreonH0b=spgb2LuUbVvWHarJWf3MOyL8qS5k_1X6gb_mjVkg@mail.gmail.com>
 <20260917-b3831e748e890287325aae49@linux.microsoft.com> <20260918-bc8077794cfb7321acf66420@linux.microsoft.com>
In-Reply-To: <20260918-bc8077794cfb7321acf66420@linux.microsoft.com>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Fri, 18 Sep 2026 15:47:12 -0700
X-Gm-Features: AcwNN1V4di_550pCxty93aMW3Wwt3uO84u73OJWwGphkReG6hvLmsGR_10uXSEM
Message-ID: <CAHreonEaErnUVQp-oe2YLv0VPuFDSBhrq3a7d==Nie5i4tgN-A@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org, 
	tgopinath@linux.microsoft.com, boris.brezillon@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_154726_593751_534E18A9 
X-CRM114-Status: GOOD (  11.72  )
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

> I made an assumption in my previous analysis. I assumed that the
> notification would be dispatched in its own thread. Digging more,
> bus_notify just invokes all the registered .notifier_call callbacks, so
> i3cdev_detach would be guaranteed to run before call_driver_probe.

Looking at this again, I think there is an issue in this area regarding
module deregistration.

If we deregister the module i3cdev_exit calls i3cdev_detach for all i3c
devices including the ones bound to different drivers, which is very bad.

i3c_for_each_dev(NULL, i3cdev_detach);

I can add a private LIST_HEAD (similar to i2c-dev) to track all devices
that are specifically using i3cdev and use that list to manage detaching
instead of dev->driver_data.

I think there was another issue with the bus notifier that Sashiko was
on the right track for.
The core lock being used wasn't the right one to protect against
attach and detach
races. I removed that lock and updated the locking inside the attach
and detach functions
to account for races that may arise from module loading and device discovery.


Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
