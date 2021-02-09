Return-Path: <SRS0=fXmT=HM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB0CC433DB
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Feb 2021 10:26:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69C4F64E30
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Feb 2021 10:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69C4F64E30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W6JkMUKRZAVJOrsFX7Rm8oDkc5dTsRQxQ6Q74iqFTXs=; b=sAKgYy2a7ez/F1jnNBCsYJbUC
	eHNZY72NEH65XJhsTci2yMHqZNfcbBYAn3MZoAz00f91seDfhyJZKrDzRujLMTVjvUNnWemuT8rsp
	TJRYNvuazpkj+4WSGStULemhhkWlT3+YgAyL8bpR0ugJPn0m57rDnTdBYsiYNIh645HkCrAAdniWs
	Mggd/2zCGSsnvzVQE7mOzKnEjvaFDPn1LyHMM/RMhlO81j6k8ZxN+OphujaOD493+ylivE4ReZ24H
	Pn559h9zF5YkONYMFfwaGDMsm/MrUx9wTwynGoirQ8750ooZ9aInB1/oAinNzUvub/i+yDlpWRXtM
	Ln7IvmJYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9mhD-00058n-Bn; Wed, 10 Feb 2021 10:26:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9KC2-0002Vr-5Q
 for linux-i3c@lists.infradead.org; Tue, 09 Feb 2021 04:00:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE5AB64E8C;
 Tue,  9 Feb 2021 03:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612843200;
 bh=BT5G6hDydO7Z4cLz9dvfPbU6nwbCCY0Hm+9TTgwZdaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cTTl5RaqXBiJ020DI3KFCN2+QG9oo9nEBzkeDfRuQHKvjUO/W2lG8+SQE1dNlQWb0
 UIw94m9cO4W8LMyCBkKVwOdTkeeMzVSUEJh4tj8oh30gWyXwni1q2baI5UAc7aQvme
 4kPiGtSwxa09L41Im7SncLXgoAY/hJtjgfNO1/Uuy1awmqQiAIf69IRCzO0QgBKxab
 bZojKVteJ2XmE7qTNygj18149E7GZXFGS8ErnSraGDcdTMN8hXDLJfOxlMo90hOgJn
 StuNodUbLqD6OLBl01LDQjSu36Nq685UOp5XqV8diNruDs8w72+EZiUew5goALK6Zl
 rIgjdx70cWgaw==
Date: Mon, 8 Feb 2021 20:59:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: Fix position of __maybe_unused
 in i3c_hci_of_match
Message-ID: <20210209035958.GA2059815@ubuntu-m3-large-x86>
References: <20201222025931.3043480-1-natechancellor@gmail.com>
 <160943653614.132002.12499200411415721355.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160943653614.132002.12499200411415721355.b4-ty@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_230002_344955_04528B32 
X-CRM114-Status: GOOD (  12.61  )
X-Mailman-Approved-At: Wed, 10 Feb 2021 05:26:06 -0500
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicolas Pitre <npitre@baylibre.com>, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Dec 31, 2020 at 06:42:23PM +0100, Alexandre Belloni wrote:
> On Mon, 21 Dec 2020 19:59:31 -0700, Nathan Chancellor wrote:
> > Clang warns:
> > 
> >  ../drivers/i3c/master/mipi-i3c-hci/core.c:780:21: warning: attribute
> >  declaration must precede definition [-Wignored-attributes]
> >  static const struct __maybe_unused of_device_id i3c_hci_of_match[] = {
> >                      ^
> >  ../include/linux/compiler_attributes.h:267:56: note: expanded from macro
> >  '__maybe_unused'
> >  #define __maybe_unused                  __attribute__((__unused__))
> >                                                         ^
> >  ../include/linux/mod_devicetable.h:262:8: note: previous definition is
> >  here
> >  struct of_device_id {
> >         ^
> > 1 warning generated.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] i3c/master/mipi-i3c-hci: Fix position of __maybe_unused in i3c_hci_of_match
>       commit: 291b5c9870fc546376d69cf792b7885cd0c9c1b3
> 
> Best regards,
> -- 
> Alexandre Belloni <alexandre.belloni@bootlin.com>
> 

Hi Alexandre,

I see as of v5.11-rc7 that this is still an issue even though it has
been applied to the fixes branch. Is it possible for this to make it in
to 5.11 final?

Cheers,
Nathan

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
