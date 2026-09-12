Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92260C88E50
	for <linux-i3c@archiver.kernel.org>; Sat, 12 Sep 2026 00:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KBF9mTFChF+fHUvpIFONxaIhIebPiI7Ww5b6gvftL4=; b=vOOCzLt7RX+tlt
	AuOCNY9vBtIZE5MiOJ3TiMf2cn8CT9cBEeSfOHufPsCVlok5FFefX7XXGZ+5txQf3aOoz08INj4kl
	l9WCZgWPl1o3+IovE+mMlfJpsv018FU8E98S9P50x7/jYB8ZlIF/gsCTz/GS8gR3XHYz0M9W7/qBJ
	ng+mq3wQDeN+gPkj0FPSH1vHHVVS0sHbRY6sDeqxCCUZSy5vetTg1Q9C1U0Cqtky7WfLt5X4k91ZK
	R5G2hhwpeJOP7KtfzqlOanh0DnBGg+5ycbJJIke2K67ypPRfGFRY2mzrXlfNpZw+JwCX4m3YppegE
	c6kuNK4DfZHv6q1Vn64w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BMW-00000000Qsc-2Fyy;
	Sat, 12 Sep 2026 00:12:58 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BMT-00000000QsH-2qmJ
	for linux-i3c@lists.infradead.org;
	Sat, 12 Sep 2026 00:12:54 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d4ddd179eso4333337b3.3
        for <linux-i3c@lists.infradead.org>; Fri, 11 Sep 2026 17:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789171972; cv=none;
        d=google.com; s=arc-20260327;
        b=WQYPjb6WfFY7mHRlqAqDJXYSh1Dx33v7PYQf/M91ixPXXYAG8Kp+pqmXjnpUnu4tJu
         NyuIVuHfa0PCJJkyIPY0Hav7lvfi+WnFNpKfMsrP4ICJaKqJoDxQwDeQ+25j0GWQ0xy0
         feAPY+ao/r1prWOmJt/bD6k3RFzS6GQb+5DQyOapuNdTLOrR5p4pVWxi17vgaKoshr2D
         Oiv1bHumU45plOw0rlo2hh4Ic+DHhc/pRqKMEs42Qev+9r325T4xmDASaB702s/GIi/Z
         QF0yKIu2a3oLOo7eVvxKDb04DqBefKl1VMVmQlOCB0KUDtIPqVyFrk0oaJAsM2lEIT2u
         RXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xQ76fY6ulaYNYKwPfApE+ipglZPuPZv8sU5oC2IS+ko=;
        fh=A5pWKK+nf9vF5Bi3i1Ym6tdQvmG2NmeLe+sV/WVhclQ=;
        b=rT2ViJM5KAXTvGH6+VexKwaFPUAXr5MPPIKICtJZUE81xdll2aIcRhFc/3E0g+Yft1
         HuhfklCyNjPvXSxXc0XYGPdMp2N9AK0ZOs9WoAiqj+jDzQi4zI7nB0t3iDWuyvEUzzEY
         8cJAbRodtc/GpTbwDe7Jvev3hBwBUS0zcoaABnQGtgumgn6MIaw4TxKpKiBwhzj5nQ4v
         ghBrqEo1Gp5oQkNQ3c6jEYa5hyWTqCIKZbjHD0zphgQjb1gxkG4+NDn5cQU6h5mfluXu
         PbfpDMhQkqLfjz4wVCkWhrsNMzi9nznbFJh9sUCiW82Dig7taRR5TcN41440lNpzY5ha
         Pd0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789171972; x=1789776772; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQ76fY6ulaYNYKwPfApE+ipglZPuPZv8sU5oC2IS+ko=;
        b=M8xIJilh+PpjDQNSIfiApRiTxuXt0hJ3y1oYW/5IOaJUwVo/gIAgNpkvHH8kj+RErQ
         6XgJThREUjrau5brs0FgqOAwIbfEFhKSg7pmS8Dx0p+olBTSjQjIHAWfZZd523HaMnGs
         X8BglE8k6aeTba44mdljq6OXzIyfakGy9e3qVQ5CljGgR5YZ5aPxbzGlSsyRWKAj1ZoF
         Zu0UNwxUA0uzHl23vDpUQBDvcq2TMdXhE44iZVPqGi13ZZ+giAsHpe86AelM0eLqlFB7
         EHcA7IB+LjcPCABP6qnkxzu4c9pAy1MfT5DnsA/ihJeWrCykQic0vVAxYK1alWMy2Zw4
         gWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171972; x=1789776772;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xQ76fY6ulaYNYKwPfApE+ipglZPuPZv8sU5oC2IS+ko=;
        b=B8UiF7TMt4bhhO64Y7BN5wHhEWmCc/c3bbFZt6ihjr2tNqmi0RQ/4pdPTuGd9om/P+
         2CJ0TKYyP+zOqwz/rLxjdRjNnkBh9kRiGpI5RceADPRbu5Z3kpiRoio3qJT7n5tiVIsS
         zUSKiFfh4E7mWtf7B8E5tuUNoVJsTHB0LBNLK61SzcogCgZcr+nfe6pyE238elNWENvt
         DQkQhGeHzm1shWD8b+sefxy6bBZDzbJY9fzoDzAJsb/F9JNadKYXRJ/0k67bvR3BSipx
         JcrwldExsB64Si44MGpEhtLZRjAQDYqNB2NrqJlkiqoVJopsXa5G1k3EZmxMku0h50Kh
         4MQQ==
X-Gm-Message-State: AFuF++lU2lR0R2T5X3qVERRB6q86qS6/pK860t6Q2ISFYsRRwZnvFqLG
	0puP+U4nKkiVOe0CvQoKW4pljv4wXl32DJ7n9+nimi5XIS8nMHMZUbBKeVpaPSy/DUcaF9uC7mm
	HmYo9ozSuWDSdPx4dGtFYUtVBSmzCmRjcom9E4Nj2
X-Gm-Gg: AYBFou1Ek5zguX4oyWYvZQHDhtp8i5/ONZIEiGQ7CI+JQqZQpjIgJktSjQlILe/Cl2W
	xn3rsrASx84gucPP2caczMeGCQZIyKQoC6UYOrNFPRAXCaITrIbenodv0NTtx5q7rcVPEz33yKO
	OQFFe2UBf8epWgpf5Q8UfWAPy28Bd8oIihK62B/G6c2k3RY+Jvda9KJ7Uul2FSH7GbrhSz+upL0
	8N+BX5Uh3cTxpU602G7nPU+iI/yyI0yDUVGvc8E6ogg2ufZf3TGoPjYJck4P7UPJUMwAoLQx4cG
	aW3CmjQXdIYVBKdBY8bcr62bUjkCffuvC3ZogJPHLoZ6pCGoAce5xJF/mVXjnet0LZQyQib5QVw
	loZe+7igbRw==
X-Received: by 2002:a05:690c:314:b0:886:30f8:ef85 with SMTP id
 00721157ae682-88630f8f5d1mr18380937b3.16.1789171971605; Fri, 11 Sep 2026
 17:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <20260911-d0e2d97df458cbf24fa42089@linux.microsoft.com>
In-Reply-To: <20260911-d0e2d97df458cbf24fa42089@linux.microsoft.com>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Fri, 11 Sep 2026 17:12:40 -0700
X-Gm-Features: AcwNN1XGf5UCGIDj0-3n6mkuZTqdVzaLGdiWSNdFIbb-PgTGwHhfgg9zPWx-lbE
Message-ID: <CAHreonH0b=spgb2LuUbVvWHarJWf3MOyL8qS5k_1X6gb_mjVkg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org, 
	tgopinath@linux.microsoft.com, boris.brezillon@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_171253_761597_D29CE24C 
X-CRM114-Status: GOOD (  11.40  )
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

Hey Meagan,

Thanks for sharing your patch series.

 The reason we have the bus notifier system here is
 1. Dynamic module loading is handled automatically: if i3cdev is built-in and
    a specialized driver module loads later, the bus notifier receives
    BUS_NOTIFY_BIND_DRIVER and immediately calls i3cdev_detach().
 2. No cross-subsystem changes needed. The bus notifier avoids touching other
    subsystems entirely.
 3. Boot-time recovery flows: For OCP Secure Firmware Recovery
    devices come up unbound and need /dev/bus/i3c/<device> available
    immediately without requiring udev rules or sysfs writes first.

Let me know what you think about that and if there's something I may be missing.

It looks like we're both going in the same direction for UAPI integration too.

If you're open to collaborating, I think we can combine and converge on a single
i3cdev driver - adopting all necessary fixes and ensuring the UAPI and features
cover both of our use cases so we have one unified series (and any
other use cases
or desires we may want out of an i3cdev driver).

I'd like to know what everyone thinks about taking that approach also
if there are any
other use cases we may be missing here, regardless of which patch set we choose.

I guess just to get things moving, if we go one way and choose to go
forward with
the bus notifier approach, Meagan would you be okay with me incorporating your
Patch 2/3 for actual_len for the i3c controller drivers? Of course
with your authorship.


Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
