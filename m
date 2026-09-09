Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5F6C79F8C
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Sep 2026 06:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39ZyjigZ1KYHOyNJzCxDLWMlcUNR5KtJJ1fdlBYjHYg=; b=RM06Sa2iBnDpp0
	QbRBzFVoZAGkOElLwYFPyjFFHcAN4l68NcfjOvX4qiTXyB3lmZOEbNoa/383dIQWS4PdjQz73vc+Y
	R0yEyCGdQlyB6D2H/UMFp7qA2ZMxnfYcokFC2Dx5hP0J43DOeXXLTp9Rkah1R0TRD8MMsjh0ssxg1
	p4drIHVniEN9E5eLi9gPCtjrYbi5nCpJhpseW/dMXCd8CKF6lc67l1R7xCHYvP/5rqViOlYtA+O1j
	g9p2zXqZYBDV9L48bnz4e3jeBkG8Q/llbbCpzbs0cQo0nwAvtJWA1uygRYh2N0FZv8rLuaU3O6521
	ZumOj8mirgf9XVbbPYKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BYy-0000000ArKS-2U2r;
	Wed, 09 Sep 2026 06:13:40 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BYv-0000000ArJd-3MIZ
	for linux-i3c@lists.infradead.org;
	Wed, 09 Sep 2026 06:13:39 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-66f78cba2e1so5545872d50.3
        for <linux-i3c@lists.infradead.org>; Tue, 08 Sep 2026 23:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788934414; cv=none;
        d=google.com; s=arc-20260327;
        b=AJwARTiyMbeAko/a6D1ni+9xVN/NTa5d2l+VZAGExeSy4jvA0vg1xa4cylDeDNisN6
         SWQGSTHhgFDRaNlrVqMURtbfYPp7TVUFgsFCY98mywS7cg6GMyheMXHTxDbJzqgyfgh/
         gvKqJOZuZEEAIx0hSzmYy5H6xVUYTT9b/lPSzzc/pgB2bUaTXuvmbUxhyshVB17Kgneg
         DEOByUMF5H9C2OcMLl58LENHEBG58GMgi9XgnmLCe0MhP2rkg21qj5vFp9j4RRtGqjmX
         tUYHzcbosP5OzhaO7a5WaIoy+wkquAkaeGgRS+6VnJSGAotcLrbOmhVZklEPvfOlmgsy
         VmCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wxz/6GsfDWh0q3fSFDoUZfAlFdVqkOfqzbjc6fNOU7A=;
        fh=EPnARbRvOgx7GHkuRAxMPUdhyZzEmS/E59Erxj54Sko=;
        b=ixPeVj2UTDC9A/YTI2kPMMgvbNHfnet9do/eVn7onm8fSr32Bw3ZNt7YcmKRB1a+Ql
         sOPc6TBFqeT0KNUjF/9ZMOBoE2Cct/Zeu7xp9VhlJfCoij0De+qa6KJxZwXGK8g7SW9h
         Ue5HlNz9SBah44Bvw+Sv1UUKig/kA8+q/PV0ETUXtPvQE0UqKh8SS8xbDvD6/sFj4Ry7
         Vjq0OY9UsthOhpNvVGzYX5Dcb9OT/jxo8f8Anazvc9lwhISbcRljF90tQhDql1JbVfO+
         Fewxkimr0I4jcnO2Q+0bLjEY8vTgx93MIqsvPyW45Ew9HLd2iIB0PF2UBBcGGKXFJjk4
         sjHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788934414; x=1789539214; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wxz/6GsfDWh0q3fSFDoUZfAlFdVqkOfqzbjc6fNOU7A=;
        b=enrB0pj1irJc1wyNT6gOjlrQpGkTqUs1AER0Z4pLhMzAwJzZpAZjVAPpiW/QoUDA8p
         +p319u6VnALm5UHNz3L4tWMPLvy4c9KQo56f0jwDE1smlgQtiw4Jht1krdOHRfv9Zc1a
         gNvvJk4GuKWlmQz2GWE0BYrFSrVL4c2DQpkndOpk/x0KMgf2K6P1AhkBiP115DNFhgTO
         LEEVAs9Rey+GSd8E5zLAtppZ9TFmSwYJbJi1IPTonfz37/V8O4AIg66p6vnmKIZtWQ4+
         EJu6Y8+f7UZ8ksU4rEyaN2gFC10ed5OQppaAbLAF4Uq9qw+PFbdVEMFQlwrV1Q3EeCLi
         Z4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788934414; x=1789539214;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wxz/6GsfDWh0q3fSFDoUZfAlFdVqkOfqzbjc6fNOU7A=;
        b=GyHuGDPJGGyOJQzZW9RCTqs4EXVsKAxK51aVE9VwwsrerL0bEi+axSDCFO/b23B8Zl
         A62BX6h8Ypv8w9awC7SIzpNI3al0JLp+vHirMxmfNbc1O0MQcnc4p0Mq6f5QvpoqQ37j
         hIqf1KH9sPP/xfwXrXa6hLoN3QB8yuELWYijjvqXslMUvx1nt+WKvC8y7RV+JpvxlUOk
         sQODiWMqonnGfp7Jp5KJsSR+3udIkuOC4r1OqEhMHe/fYmVOeEr0hDV5/5RVEJSFXhXq
         LP9qpbMZZ33nCDv4cGUmdUX7EPNfRE1KdnCpemV7+R9GmsglfxnDCPZGvVkK2Px0Nq/C
         It7A==
X-Gm-Message-State: AFuF++nvr8e5C98/CIncpfXfbxOdKhxUoJo9DCOcwRRw9+1Yb5iHGTza
	NfNDfOhs8P4sC1aUiy7kX50kwBRI2jUSt3ld+dNlynef9zOVQOulnAVdR5xviAVTga8jXY7RxG1
	VWv6sdCdT9n92RqCeIu8OW2TNUwSqjdpWaoB/LGf9IXwrU5DLoW9DNA3e
X-Gm-Gg: AYBFou30jppHmcDcj+v0gfrOmNlz5daimBsz8bWndexajda1Jw3oOfuHtOWas/SogyK
	VGuoKx2X/EZvYVbzdKB236++yXoFt72M5Fz8b30zj0o1coqDZdIq60ohusjXow4Hvz310NYvXfy
	8KgRSA1/gdm7n2jwWWMszFQnklFMa/gv38p214LCBlKrx6BBpqI5OYlp+FVQ66s+ue77dmj1Im5
	WxAZV25hUqsZDfwoUZdx4PtG52PWjhFYjhbymIWVIJdZMP9+G1SmtUim32kt1y0BdcWxUjOnXEU
	XeguYT/L88PiE0FlXpkuSSmhelaF+fhK3J4W6BHO8/7JRdlr8nqp5CJz1EehYZBbxZ1AdHCy14J
	eEkVvi5tZKKU=
X-Received: by 2002:a05:690e:c4a:b0:66c:e25c:f7ae with SMTP id
 956f58d0204a3-66fb5abd2d7mr10470629d50.40.1788934413842; Tue, 08 Sep 2026
 23:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <2026090737-unicycle-imprudent-dcd2@gregkh>
In-Reply-To: <2026090737-unicycle-imprudent-dcd2@gregkh>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Tue, 8 Sep 2026 23:13:22 -0700
X-Gm-Features: AcwNN1VGOtr2r7ZU5xoiRoYbwpSQVK1QddXIO_qLoJ-bckeoZOb5-01kaA5BeDA
Message-ID: <CAHreonG1qHNuk755MYaN7SPFtp3Fg2PMW=Gg-3yZXO17v_c9Eg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Arnd Bergmann <arnd@arndb.de>, Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_231337_957573_6AA04AAB 
X-CRM114-Status: GOOD (  13.91  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBTZXAgNywgMjAyNiBhdCA3OjQy4oCvQU0gR3JlZyBLcm9haC1IYXJ0bWFuCjxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIFNlcCAwNiwgMjAyNiBh
dCAwODoyNzo0N1BNICswMDAwLCBTYW0gQWdhemFyeWFuIHdyb3RlOgo+ID4gKy8qKgo+ID4gKyAq
IHN0cnVjdCBpM2NfaW9jX3ByaXZfeGZlciAtIEkzQyBTRFIgaW9jdGwgcHJpdmF0ZSB0cmFuc2Zl
cgo+ID4gKyAqIEBkYXRhOiBIb2xkcyBwb2ludGVyIHRvIHVzZXJzcGFjZSBidWZmZXIgd2l0aCB0
cmFuc21pdCBkYXRhLgo+ID4gKyAqIEBsZW46IExlbmd0aCBvZiBkYXRhIGJ1ZmZlciBidWZmZXJz
LCBpbiBieXRlcy4KPiA+ICsgKiBAcm53OiBlbmNvZGVzIHRoZSB0cmFuc2ZlciBkaXJlY3Rpb24u
IHRydWUgZm9yIGEgcmVhZCwgZmFsc2UgZm9yIGEgd3JpdGUKPgo+IFlvdSBkbyBub3QgZGVzY3Jp
YmUgdGhlICJwYWQiIHZhcmlhYmxlLgoKSSdsbCBhZGQgYSBkZXNjcmlwdGlvbiBmb3IgInBhZCIu
Cgo+IEFuZCB3aHkgbm90IGNhbGwgInJudyIgImRpcmVjdGlvbiI/CgpJJ2xsIHVwZGF0ZSAicm53
IiB0byAiZGlyZWN0aW9uIiBzaW5jZSB0aGlzIGlzIGV4cG9zZWQgdG8gdXNlcmxhbmQuCgo+ID4g
KyAqLwo+ID4gK3N0cnVjdCBpM2NfaW9jX3ByaXZfeGZlciB7Cj4gPiArICAgICBfX3U2NCBkYXRh
Owo+ID4gKyAgICAgX191MTYgbGVuOwo+ID4gKyAgICAgX191OCBybnc7Cj4gPiArICAgICBfX3U4
IHBhZFs1XTsKPgo+IFlvdSBkbyBub3QgZW5mb3JjZSB0aGF0IHBhZFs1XSBNVVNUIGJlIHNldCB0
byBhbGwgMC4KCkknbGwgYWRkIGEgemVybyBjaGVjayBhZ2FpbnN0IHRoZSBwYWRkaW5nIHRvIGFk
ZHJlc3MgdGhpcy4KClRoZSBuZXh0IHJldmlzaW9uIG9mIHRoZSBwYXRjaHNldCB3aWxsIGluY2x1
ZGUgdGhlc2UgdXBkYXRlcy4KClRoYW5rcywKU2FtCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlz
dApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
