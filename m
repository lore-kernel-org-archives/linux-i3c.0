Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971B9D49207
	for <linux-i3c@archiver.kernel.org>; Tue, 19 Nov 2024 05:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiKQ6+EDHomcX5mXr5wmXf1/Eb3HSOGSHEJHirNvD74=; b=nr3JxXXjehaK3gUdMfQKIxO+2+
	VVgXJUv7JlGbQsZwRZt5uahw/TTra3vXH6ScIeoQkYsGgDtfFVEzDTNSZq+YRCux4MwGMH1m+UjBE
	ocDy5QZwnZIyT6EXoH9RayiZGU0p95GX/SJIb8ir7wWLiMUb7sGn9Ti8TmY/yxYRH9d5DZNhTO9wc
	y+8z5DbwAZsSyz1/sFxsvrnlUTqYPRq7704uewAw7xfKtyhaaP0ss5eXMNapr+xUI48AE8o/Dtmkw
	p9B4Yu3HzY4R87MRddbT3mUFdlxhNAPPfP0sOuK3eBNkJAnbjbhrkFZ9HbCB/QFPFNDdfJohTQCvl
	sCbNRknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDGgs-0000000BPyb-19HA;
	Tue, 19 Nov 2024 05:22:18 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDGgp-0000000BPy7-36jL
	for linux-i3c@lists.infradead.org;
	Tue, 19 Nov 2024 05:22:17 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso1769733b3a.3
        for <linux-i3c@lists.infradead.org>; Mon, 18 Nov 2024 21:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731993735; x=1732598535; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=b+jTgEZWXmNFEq5qgdYvz4H3191ETyR3hzCzLkoLsgA=;
        b=SFVNjPJnh0C2KsB8G5Z5VWKT6eVGSOojNSYFYPKwgVkXJxM5we8uHVfH7GqXxOQLjM
         Kxay1P3JpNcmXm99Ze7IZrbHdY7NYa2UK/AYDLzuzet4HTyu8/BrraC3sEskhcdhVdQ8
         Eh6u+nTt2HwyL54JyoXX/mnp17tSmjt0hmWYgKHqBzLYWI9HDSG4XNxXfDZLnrKiVL4w
         4pdcscSWx96YaV24n+aiokM6qOrl8WdxKi0Z0KeiUHxKSE4f5tvBA/MkFSOr4R2QDz9E
         0tHFCOdiWYeov1Dh5EW05wrUYqe0m27t60JhJHDNYDuQjPfbFwhuqi4O3yy3ram1itKK
         MDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731993735; x=1732598535;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+jTgEZWXmNFEq5qgdYvz4H3191ETyR3hzCzLkoLsgA=;
        b=j0qbFyD4kwV1dlS9Ld4ACT+0ZsCViUCQd5nTM9AKoNBJdjWSbr3jxiezKlwoGaWTPH
         gR9ZgAo716i1wi47cef6mmxxvghk10VHhw/mCyUUPMjPuMwig9K0yWAH5bUpsquknyCI
         QquZGAIknMvuoawfWFJSb7IuAvRIErvs0mcYScr0a2sV5VbWqLapoCHMU466M41AdpTy
         ClcMPHJUxAePuMzc67pzWfF7XmO79p16cXbCHQ33nw1vWau781v6QKyQnacZ+oFt/96A
         qGog+FVMxfgyDM7Gv7Q81d+XLH8/wOVVQSyr9mPrx/ZTrfiJLUY+dm2mZoAMotDhsqVP
         ekLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv2ZKmSujAFv3JR8iSB9WPT/EI2r7jl7LQOfFiv/KoA+TM5ab4bTeNRV2h5xAimb1GPhCyiw8FWNw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1EDP8oBAa38Xn562/vN2/Yu035grP8mPC62Opr+p6/LDa9Bq6
	hDVjOFlCFqok2MBYTxJ4K70pX74kz9Q7nvV2ddjOyNMtCZzX8mVP/G/kDg==
X-Google-Smtp-Source: AGHT+IG8C8L2nY0ava6fJ4wS57IrW0Xc45mS5TxyJK3LMDL1YuuC5xP+Lzcb07vgxyzgKvTOZtcIWw==
X-Received: by 2002:a05:6a00:138d:b0:724:63f1:a522 with SMTP id d2e1a72fcca58-72476cd092dmr20419943b3a.22.1731993734602;
        Mon, 18 Nov 2024 21:22:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771e1fcesm7224161b3a.152.2024.11.18.21.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 21:22:13 -0800 (PST)
Message-ID: <47333790-fe55-48e7-a154-54dd42d86088@roeck-us.net>
Date: Mon, 18 Nov 2024 21:22:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Looking for USB<->I3C adapter
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 linux-i3c@lists.infradead.org
References: <d2e42b5f-7108-4752-b16b-3a8ff7c22079@roeck-us.net>
 <05803e88-f66d-4cc9-8737-e3b49790b85b@quicinc.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <05803e88-f66d-4cc9-8737-e3b49790b85b@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_212215_782109_8B410530 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxMS8xOC8yNCAyMDo0MiwgTXVrZXNoIEt1bWFyIFNhdmFsaXlhIHdyb3RlOgo+IAo+
IAo+IE9uIDExLzkvMjAyNCA5OjQyIFBNLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+PiBIaSBhbGws
Cj4+Cj4+IEkgYW0gbG9va2luZyBmb3IgYW4gYWRhcHRlciB3aGljaCB3b3VsZCBsZXQgbWUgdGVz
dCBJM0MgZHJpdmVycyBmb3IgTGludXguCj4+IEZvciBJMkMsIEkgdXNlIHRoZSBEZXZhbnRlY2gg
VVNCLUlTUyBhZGFwdGVyLsKgIFRoZSBvbmx5IHByb2R1Y3QgSSBmb3VuZAo+PiBzbyBmYXIgZm9y
IEkzQyBpcyB0aGUgQmluaG8gU3VwZXJub3ZhIEhvc3QgQWRhcHRlciBjb21iaW5lZCB3aXRoIHRo
ZWlyIEkzQwo+PiB0YXJnZXQgYm9hcmQsIGJ1dCB0aGF0IGhhcyBhIHByaWNlIHRhZyBvZiBhbG1v
c3QgJDEsNjAwIHRvZ2V0aGVyLiBUaGF0Cj4+IGlzIGEgYml0IG91dCBvZiByZWFjaCBmb3IgbWUu
Cj4+Cj4+IElzIGFueW9uZSBhd2FyZSBvZiBhbiBVU0ItSTNDIGFkYXB0ZXIgd2l0aCBhIGRlY2Vu
dCBwcmljZSBwb2ludCA/Cj4gTWF5IHRha2UgYSBsb29rIGlmIHRoaXMgaGVscHMgeW91IC0gaHR0
cHM6Ly9naXRodWIuY29tL3h5cGhyby9JM0NCbGFzdGVyL3RyZWUvbWFpbj90YWI9cmVhZG1lLW92
LWZpbGUKCkhhcmR3YXJlLXdpc2UgdGhhdCBsb29rcyBsaWtlIGV4YWN0bHkgd2hhdCBJJ2QgbmVl
ZCwgb25seSBpdCBsb29rcyBsaWtlIEknZCBoYXZlCnRvIGltcGxlbWVudCB0aGUgVVNCIHNpZGUu
IEknbGwgc2VlIHdoYXQgSSBjYW4gZG8uCgpUaGFua3MhCgpHdWVudGVyCgoKLS0gCmxpbnV4LWkz
YyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
