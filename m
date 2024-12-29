Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CB3E7719D
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwnAV526cCY9Oe75/c1rQeddbf2Jv/7XOT/GCbUEBKg=; b=Bh45Dqcwapa5IG
	rZT7TlLntOd21x7EG2k9uCKxlvjYQKRxhkESCgHh4icKQbqsJTcbJ0AZh7DZk7Hz+VcueXD0QBZj2
	6KmAK3MOHZUhX4+qUaaRFAu2rrOIfSbK2V7CMMc4LpHOI3IK5K33fjwhxZUjEJ/WVrkOJAq9inqdU
	gYVLOezrNSFQXkID/HNQeB7XtSRL6D9xL27Xbhl6Lgbc0W2uvGcGIgKExyg087TUCkJw+o77ZeDt5
	FF7hH9LVucDkFLTJYe/2rDVoP9X3M86GuxKb6IWeBYtNnl7JT2LP0d8BEf8gd+7TryM0tXj04JrA0
	2dum4W8we4DITCCvFnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2w-0000000F5RP-3qxd;
	Fri, 10 Jan 2025 11:19:22 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRrCn-00000003JEU-0OfS
	for linux-i3c@lists.infradead.org;
	Sun, 29 Dec 2024 11:11:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43690d4605dso20841315e9.0
        for <linux-i3c@lists.infradead.org>; Sun, 29 Dec 2024 03:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470691; x=1736075491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alRavL5tqUSRZ2Yj2nXOybmnSzuCB0kWS+p4Y3N4Ayw=;
        b=YNshFz6z5JimxvtBjA1DOYqoP0xEQgXIQCk2T80KYF/I/ry5zh4UeX6PYh0zt/ocJ6
         LFQPHDp3n8tiED7sMgXT1JhD5U3q8dB6T6pAPrBfy0F3/ewwT98ckG1oizKONrnARyeN
         uN1lrYQxYE2RRnXpFfL31vBXf/uH06Ye+SmOZONxQE8JE6QqAU5Gl+ylBz4ueeimA1D1
         sXtiZTVHkcTiyTNJvt6fb9q4AbtnTeiGhX/mfjbmgtrx9IiHROAKKfbWlsK2pyb3zsoH
         nIpKyRMTOZQZ9HF6uWou+Pue6k3A7aTPylhn+IM6w4DtZKbxm9SKcxMrzINx+WT57WuZ
         YlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470691; x=1736075491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alRavL5tqUSRZ2Yj2nXOybmnSzuCB0kWS+p4Y3N4Ayw=;
        b=UWo2PQxb7BErCfcjEH1TujIT88hVYGYfKh/K/Hz7fFWqe0Qx3UDWPgPnTOjcVautrN
         vZJl3n6hLZo68yIiJ+dBTPfDv6uDhF6VNeMMBICo7jjQTxokAWS19otTSMRIhcwPlJDV
         LEmWormveYbiows1vjg4g0AdRZ1ROeF1CJ62yYKaZB4CwbX9tK2xA/KM5JeoAr0d3yq4
         nw4qbtQPTbXunARoIImvg1tzqhZgz48qf0uJ6Dmdouvh1wYrpYXKpgDrQNsEVY834TZd
         XY8NbbO6KZT37sYT8Xu5J+Kdda9o5NS+R28mKBapRfFmjuHox77zrqtJnsWSTI/IcHfy
         uwog==
X-Gm-Message-State: AOJu0YyqMbcIGaHrdcgoKxMZLT0pxhLcCPStwzweSsICygeB+YqGVr/2
	UXl0gPMHmBMh1bq2zD5Ms/5eii7GDoT9nVHvl5p9IvCuahLRCQAG
X-Gm-Gg: ASbGncvSFcYLDmeGFXUl7sWV5wsiE97FkeoV+BwHS3TqrvMYrW1n9tvfw4oeZzeimou
	kCCCAzwuhXFaFs6t+S5yqq8HuuVmx9HvhcJHun21p8GCn0D2heH5AqMr0XodLb3NZCNwt0Tqxec
	i+UwXxZShwQ63MRAI6SFcqp+RqVQgni940N6+rR2Pfb2tplPf1xjGIRfvaD9PNq8++F7piaASLj
	SRbz47GWUVLt1DyaOc90sISNTRUbCuuemY40SJDriU2NTCIuIzcHLqGSE3/CscRlE33k7hTjcaO
	guAKjFduyEAollXous0dEKQ=
X-Google-Smtp-Source: AGHT+IEvhILNv+8E7cgm3HzPQ0J+dOVEEE4NtAmI7c7pIxR76OSySUaVBboe+cEy3lDBmcbs3nVwjg==
X-Received: by 2002:a05:600c:3110:b0:434:fa24:b84a with SMTP id 5b1f17b1804b1-43668b499e0mr235319465e9.25.1735470690932;
        Sun, 29 Dec 2024 03:11:30 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm323551715e9.43.2024.12.29.03.11.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Dec 2024 03:11:30 -0800 (PST)
Date: Sun, 29 Dec 2024 11:11:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Guenter Roeck <linux@roeck-us.net>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Yury Norov <yury.norov@gmail.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: Re: [PATCH RFT v2 1/5] bitops: add generic parity calculation for
 u8
Message-ID: <20241229111129.2602d219@dsl-u17-10>
In-Reply-To: <20241229101234.2896-2-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
	<20241229101234.2896-2-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_031133_160264_3F0A95D5 
X-CRM114-Status: GOOD (  32.17  )
X-Mailman-Approved-At: Fri, 10 Jan 2025 03:19:21 -0800
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

On Sun, 29 Dec 2024 11:12:29 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> There are multiple open coded implementations for getting the parity of
> a byte in the kernel, even using different approaches. Take the pretty
> efficient version from SPD5118 driver and make it generally available by
> putting it into the bitops header. As long as there is just one parity
> calculation helper, the creation of a distinct 'parity.h' header was
> discarded. Also, the usage of hweight8() for architectures having a
> popcnt instruction is postponed until a use case within hot paths is
> desired. The motivation for this patch is the frequent use of odd parity
> in the I3C specification and to simplify drivers there.
> 
> Changes compared to the original SPD5118 version are the addition of
> kernel documentation, switching the return type from bool to int, and
> renaming the argument of the function.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Yury Norov <yury.norov@gmail.com>
> Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Changes since v1:
> 
> * renamed from 'get_parity8' to 'parity8'
> * use XOR instead of OR in the kdoc example (Thanks, Rasmus, for both)
> * rebased to 6.13-rc4
> 
>  include/linux/bitops.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index ba35bbf07798..c1cb53cf2f0f 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -229,6 +229,37 @@ static inline int get_count_order_long(unsigned long l)
>  	return (int)fls_long(--l);
>  }
>  
> +/**
> + * parity8 - get the parity of an u8 value
> + * @value: the value to be examined
> + *
> + * Determine the parity of the u8 argument.
> + *
> + * Returns:
> + * 0 for even parity, 1 for odd parity

I think I'd return 0x80 for even and 0 for odd.
That just need the 'magic constant' changing and masking with 0x80.
Also rename to parity8_even() - since it returns non-zero for even parity.

> + *
> + * Note: This function informs you about the current parity. Example to bail
> + * out when parity is odd:
> + *
> + *	if (parity8(val) == 1)
> + *		return -EBADMSG;
> + *
> + * If you need to calculate a parity bit, you need to draw the conclusion from
> + * this result yourself. Example to enforce odd parity, parity bit is bit 7:
> + *
> + *	if (parity8(val) == 0)
> + *		val ^= BIT(7);

That then becomes:
	val ^= parity8_even(val);
which is what a lot of the code seems to want to do.
With your definition you could do:
	val ^= (parity8(val) << 7) ^ 0x80;

(and I'm sorry, but IMHO 0x80 is better than BIT(7))

	David

> + */
> +static inline int parity8(u8 val)
> +{
> +	/*
> +	 * One explanation of this algorithm:
> +	 * https://funloop.org/codex/problem/parity/README.html
> +	 */
> +	val ^= val >> 4;
> +	return (0x6996 >> (val & 0xf)) & 1;
> +}
> +
>  /**
>   * __ffs64 - find first set bit in a 64 bit word
>   * @word: The 64 bit word


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
