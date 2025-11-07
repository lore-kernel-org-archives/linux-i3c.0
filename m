Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3121BCCF9E3
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Nov 2025 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cg/2jzHhtxg8jmCS7T6nd+sjXwP+KUkDysaS7lEnxb4=; b=EyutQ+IMwevPTl
	NqI+NWCw5SMpLE3zPoAqD8lQX+Nqc3uCPB8oCLh9PyNBLDUBTQeqRZuvCyfxSeBZTOHbT0u7pwUdv
	oZtsEjTgrzXMQ6tTn5i8AZqgG8zPa+7AmjDEKeRzChN/CptUmwtDM/EbJAtcyaOSmbW2yNXTo6aUp
	u7ET6gzP0O9fK1/5WX+FJ0n46sf6AGWtQ6mGj1+ndHFmgOeWoAfK9ncNUAAKVtrGmnDDIWkJAEfdd
	ARuRJooGFCiVYkVJmTj/WvCEc83Iu7Dpx6l5wrw+ToMesJPPcZ2yolCU0cn99s3D/ewx0ShyRQD25
	qN0hNWshVNGaxHvwnvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMXS-0000000HPFm-3shH;
	Fri, 07 Nov 2025 13:30:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMXQ-0000000HPEY-3Mx6
	for linux-i3c@lists.infradead.org;
	Fri, 07 Nov 2025 13:30:02 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so468248f8f.3
        for <linux-i3c@lists.infradead.org>; Fri, 07 Nov 2025 05:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762522199; x=1763126999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9uKcl/f9ZChp5UYMtJdyOFq+FU1Dyf96Ve7s2R428o=;
        b=HoCPfOQV5I5P/n7QL/70nFgCc/nJSns9UrxMhgObZcyoTnKmbZC7f5biZBQZKAMb7u
         0S4wGoCusMmm/0Jfc6wA4E/XrTWuuemnhE6XU77Zsn6Pi1uoS0unEtlq7KXFG/IEcBK/
         HIe+zvTXvPDiVMmJY5PdrsxSBCzvnLKgthFsgS7zPADDs+nO0f3kuM85Ds0wG9zhjY3z
         ngbkX4qOLb9X6b4FLEXl631MtRVVbFRWw8EWc+emkiGeT5OqWZpsJAKDZeKizT6SZyuE
         TowGvwgevNJnJOpoQGtNRvp7+9qvbACcrx7NzX6my0wFuF3YbvOkeYyoruRv4qqTk68m
         5iUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762522199; x=1763126999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9uKcl/f9ZChp5UYMtJdyOFq+FU1Dyf96Ve7s2R428o=;
        b=azgdLe/XbE4OQ0oM3+Zj37Mb1idtSDGllyfJK9Vr2x8XzQ3+FTqZHe6xODfNO5EPpj
         RMvQkkZinM6SwXe8XzZkW1rJ+Hev3F6q7J9y/vBGXWcaWDz/yhVJMosWUup4bZwQTkKt
         83kXbDtyz+7xSPYDiOHHlfdHAawBGSPGYu3a/1mtninH42mRTbgUe4J7rj20UbHTEDRo
         JnjJ84/OFeYzAKZMxh7g4Wa1xO8ONqiVWSlw7QIDhW2NpjH6ZvMgBERishER1k8wslzD
         gO/Camy8gqQOmkhep4d7LA5JmkW8ozvpkfHCZY77ok2bBZNbEhpFE6yYsawRmGf6w/Xg
         Co0g==
X-Forwarded-Encrypted: i=1; AJvYcCVjfRSrwFGItO7eXZyHwnyaerLtZP7rVpV46eI/L4QEaGLQNzjoJf8P0WHOtLhfW0uSKLT+IJm8Toc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCnIJprmo8JhISsfZ+YXQ/nVMMS0M0sRer1x4JlITLaAMgOh9q
	enzcLaThFwBcXCtZIlCxGBXb2K5QU2Dd7aoaudYqRq3YCTeYOahD4cKPrEdpDvJ/kEQ=
X-Gm-Gg: ASbGncsDVo3d925WWBQj1DO+NIAOzL4Wuu3ipgzBkC29QGBiXdULmgCeHRyMtif3d7J
	oDdp45dn8ZPCZ0a0aKYiUKq0n6V1ZS25Z6apf+ruAC2/WZfApGLiaMyDyllmsTiaGUkwKCweJQm
	j4MEkscskdIfYLXy6xnUXGp/hG0i3N/612K39bSht64WC24aOtYXoiZIOJKmXNm6odJuHVY8dtT
	lJaeFBIwvXfV6b/U5MPRbGwe4cNla6AtnermYvj13ufZvj2uth2tOfh3r5jM4YMtHRrg8FGbmpE
	ZBqes2RFzzq/kaxOxsDlsyTi1jSSIdErnuiBUJsN8lsyoBg5dKMt/53lia9JCEUUf3f3Ajl1Q/S
	VD/x7ESo86idBZBDwSiotyvnOJzfNHC1tObgCP+KAjMJ5+iH9yY1hbwa7/sY7XvFX9/LsMWBe32
	Nk/69ZnX3iyEPwegsrWMMCgBR/
X-Google-Smtp-Source: AGHT+IG1zulGwSQbhYh/38/sTDo6Jn/J1fjvMhHK5mO3mv4/FtwtJPlGpH+oi0kLDn5Jv03MwMReRw==
X-Received: by 2002:a05:6000:4010:b0:429:c8f6:5873 with SMTP id ffacd0b85a97d-42ae58d0151mr2665587f8f.22.1762522198627;
        Fri, 07 Nov 2025 05:29:58 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e07asm5310756f8f.17.2025.11.07.05.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 05:29:58 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH] i3c: master: add WQ_PERCPU to alloc_workqueue users
Date: Fri,  7 Nov 2025 14:29:49 +0100
Message-ID: <20251107132949.184944-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_053000_860266_24A8015F 
X-CRM114-Status: GOOD (  14.57  )
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

Q3VycmVudGx5IGlmIGEgdXNlciBlbnF1ZXVlcyBhIHdvcmsgaXRlbSB1c2luZyBzY2hlZHVsZV9k
ZWxheWVkX3dvcmsoKSB0aGUKdXNlZCB3cSBpcyAic3lzdGVtX3dxIiAocGVyLWNwdSB3cSkgd2hp
bGUgcXVldWVfZGVsYXllZF93b3JrKCkgdXNlCldPUktfQ1BVX1VOQk9VTkQgKHVzZWQgd2hlbiBh
IGNwdSBpcyBub3Qgc3BlY2lmaWVkKS4gVGhlIHNhbWUgYXBwbGllcyB0bwpzY2hlZHVsZV93b3Jr
KCkgdGhhdCBpcyB1c2luZyBzeXN0ZW1fd3EgYW5kIHF1ZXVlX3dvcmsoKSwgdGhhdCBtYWtlcyB1
c2UKYWdhaW4gb2YgV09SS19DUFVfVU5CT1VORC4KVGhpcyBsYWNrIG9mIGNvbnNpc3RlbmN5IGNh
bm5vdCBiZSBhZGRyZXNzZWQgd2l0aG91dCByZWZhY3RvcmluZyB0aGUgQVBJLgoKYWxsb2Nfd29y
a3F1ZXVlKCkgdHJlYXRzIGFsbCBxdWV1ZXMgYXMgcGVyLUNQVSBieSBkZWZhdWx0LCB3aGlsZSB1
bmJvdW5kCndvcmtxdWV1ZXMgbXVzdCBvcHQtaW4gdmlhIFdRX1VOQk9VTkQuCgpUaGlzIGRlZmF1
bHQgaXMgc3Vib3B0aW1hbDogbW9zdCB3b3JrbG9hZHMgYmVuZWZpdCBmcm9tIHVuYm91bmQgcXVl
dWVzLAphbGxvd2luZyB0aGUgc2NoZWR1bGVyIHRvIHBsYWNlIHdvcmtlciB0aHJlYWRzIHdoZXJl
IHRoZXnigJlyZSBuZWVkZWQgYW5kCnJlZHVjaW5nIG5vaXNlIHdoZW4gQ1BVcyBhcmUgaXNvbGF0
ZWQuCgpUaGlzIGNvbnRpbnVlcyB0aGUgZWZmb3J0IHRvIHJlZmFjdG9yIHdvcmtxdWV1ZSBBUElz
LCB3aGljaCBiZWdhbiB3aXRoCnRoZSBpbnRyb2R1Y3Rpb24gb2YgbmV3IHdvcmtxdWV1ZXMgYW5k
IGEgbmV3IGFsbG9jX3dvcmtxdWV1ZSBmbGFnIGluOgoKY29tbWl0IDEyOGVhOWY2Y2NmYiAoIndv
cmtxdWV1ZTogQWRkIHN5c3RlbV9wZXJjcHVfd3EgYW5kIHN5c3RlbV9kZmxfd3EiKQpjb21taXQg
OTMwYzJlYTU2NmFmICgid29ya3F1ZXVlOiBBZGQgbmV3IFdRX1BFUkNQVSBmbGFnIikKClRoaXMg
Y2hhbmdlIGFkZHMgYSBuZXcgV1FfUEVSQ1BVIGZsYWcgdG8gZXhwbGljaXRseSByZXF1ZXN0CmFs
bG9jX3dvcmtxdWV1ZSgpIHRvIGJlIHBlci1jcHUgd2hlbiBXUV9VTkJPVU5EIGhhcyBub3QgYmVl
biBzcGVjaWZpZWQuCgpXaXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlIFdRX1BFUkNQVSBmbGFn
IChlcXVpdmFsZW50IHRvICFXUV9VTkJPVU5EKSwKYW55IGFsbG9jX3dvcmtxdWV1ZSgpIGNhbGxl
ciB0aGF0IGRvZXNu4oCZdCBleHBsaWNpdGx5IHNwZWNpZnkgV1FfVU5CT1VORAptdXN0IG5vdyB1
c2UgV1FfUEVSQ1BVLgoKT25jZSBtaWdyYXRpb24gaXMgY29tcGxldGUsIFdRX1VOQk9VTkQgY2Fu
IGJlIHJlbW92ZWQgYW5kIHVuYm91bmQgd2lsbApiZWNvbWUgdGhlIGltcGxpY2l0IGRlZmF1bHQu
CgpTdWdnZXN0ZWQtYnk6IFRlanVuIEhlbyA8dGpAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTog
TWFyY28gQ3JpdmVsbGFyaSA8bWFyY28uY3JpdmVsbGFyaUBzdXNlLmNvbT4KLS0tCiBkcml2ZXJz
L2kzYy9tYXN0ZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9p
M2MvbWFzdGVyLmMKaW5kZXggZDk0NmRiNzVkZjcwLi41MTliOThjMzdhYzcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaTNjL21hc3Rlci5jCisrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCkBAIC0yOTI1
LDcgKzI5MjUsNyBAQCBpbnQgaTNjX21hc3Rlcl9yZWdpc3RlcihzdHJ1Y3QgaTNjX21hc3Rlcl9j
b250cm9sbGVyICptYXN0ZXIsCiAJaWYgKHJldCkKIAkJZ290byBlcnJfcHV0X2RldjsKIAotCW1h
c3Rlci0+d3EgPSBhbGxvY193b3JrcXVldWUoIiVzIiwgMCwgMCwgZGV2X25hbWUocGFyZW50KSk7
CisJbWFzdGVyLT53cSA9IGFsbG9jX3dvcmtxdWV1ZSgiJXMiLCBXUV9QRVJDUFUsIDAsIGRldl9u
YW1lKHBhcmVudCkpOwogCWlmICghbWFzdGVyLT53cSkgewogCQlyZXQgPSAtRU5PTUVNOwogCQln
b3RvIGVycl9wdXRfZGV2OwotLSAKMi41MS4xCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
