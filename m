Return-Path: <SRS0=Kzly=4C=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E393C2BA83
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Feb 2020 15:24:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B68C2082F
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Feb 2020 15:24:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uxahl2bj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B68C2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9FdIXduBqa+LozRf2tg2m/jkyd6vca+yy/bYMh1hbC8=; b=Uxahl2bjEQrHEX
	xos2ap/vMaf03DVjn+uzRB4GWJ8f9O8pG1YHOFmAo6opfLaQz1MwMkAzl6o/8OdNVVLEP45++/c7N
	3hWk7IvU5mKIWOnddqQgRN6ngsMASMcb1UH1p9o9BNflMKUtYay0z4xFHD9W2XMGXN4GOOEXetkSC
	tdC8OD9jBca3TWiGNgRapi/jTxCs8moTIiadqcmF/iC6Tx0G5ee3lT9roPGWUYQVJ3SgnAXqy2qUO
	o2nRiv+aLc8dr7ZZ6c0O89eiQVYd3BQEXV3MzCVQDckVwTdLbYj6gZdw+fAfOlpFEEs7xiCj1Az5c
	ZiMzAa3vZrEnJxkyPHYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2cp3-0003Ag-GE; Fri, 14 Feb 2020 15:24:05 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2cnt-00028F-9R
 for linux-i3c@lists.infradead.org; Fri, 14 Feb 2020 15:22:55 +0000
Received: by mail-oi1-f196.google.com with SMTP id v19so9702540oic.12
 for <linux-i3c@lists.infradead.org>; Fri, 14 Feb 2020 07:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yIggBj4G9kgv1X4mJi9/dFCdqr/FCrkCCyEABk4uhMw=;
 b=Hsy4uFuw9UYPvkkh8gkb2uBCYWI4dtJpvjMzIBkZQeAxXkX9LVzy9bS74PaoC1ImbB
 vgVuXhY5+2mQCaa0EemPVa3ZXMR++JB+UKHjqHXTaLRkTGc6nSOacjYqpOeYktgqAPYM
 YRICS09/eqe5swzIpt6bCCBSbVzG8rCaI8uPwPCc3WeQ2Auvoe3WvZ7PjWPzPkxkONXd
 tembBw0y340NEi/P+4zcok/cdtbVKYSwdqn3xcEwUnIrHmhWoEokS4QOpsJpm5tASSB7
 V2T3EXnRYOnicDejI6BaE50Ennd2Unucn7ycXLTgrgfwmDuTAnEyd/g40zn8h5+mTgYm
 o4EA==
X-Gm-Message-State: APjAAAVSEXrV0Wlzpv/Gpx0xnx0keCoTwTkYbp/CCyFLvFVjJv9sYlF5
 uo8UCmr4AgxEsP+9ieBC4CCAe3UtTFpzYO6qOLA=
X-Google-Smtp-Source: APXvYqye4I6Qrx3Pp5fei43PSiub4c+FpCAtTwSW/vHY8MqpLJ05TZs3rXp9SEyb+DZnXGrlnhfoEC5LbeUiXL8q5FI=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr2123459oia.148.1581693771302; 
 Fri, 14 Feb 2020 07:22:51 -0800 (PST)
MIME-Version: 1.0
References: <20200214145853.24762-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200214145853.24762-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Feb 2020 16:22:30 +0100
Message-ID: <CAMuHMdWwXOb5vkexeop7zaqm7aUYcfMojVj+VrjuTUXJ+kaamA@mail.gmail.com>
Subject: Re: [PATCH] i3c: master: no need to iterate master device twice
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_072253_344385_95398B69 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, Feb 14, 2020 at 3:59 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We already have the master device in a variable, reuse it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
