Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21A3CAC599
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNyOEDttxKcVcKtiEcIR6Rgs2/TghTFAxqiHIMK+Hpk=; b=CNA+/Nkw7GjqWc
	WFr2mm0ouj9JUx07xcsoLJDPtadFuLY484QxXRvcTOM6VV+0/dBbFJbCM7C1ab1VQ6K4YAE9YwXB+
	DUjI+hB5lD/7E2E5U5FMTaCQa0o6ZFQnlbWjXlWtQj0S4QgZhkSMbMHiko3za3ldhsXXRCtUa35Bp
	iqy7ZTzK48mTCISkyyrYqo58K9pJbCvP5rvanAmKtRX+kIRVBNpsIXGeHAZdQIlTn4UnJtIfcCE5Q
	zaCEJ3svg3zVrZQXCN+b1hQxyoO5CocoAmJa7SZEVYk5XkmL5kr5hnCD3EJJmAO9fvCQ9408BQYYO
	rkj00hM6PVFvuM9Uo+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPc-000000029lP-2aC4;
	Sun, 14 Sep 2025 20:33:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukP3m-00000003BKv-48XN
	for linux-i3c@lists.infradead.org;
	Fri, 08 Aug 2025 15:31:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C82D5C68F7;
	Fri,  8 Aug 2025 15:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA07C4CEED;
	Fri,  8 Aug 2025 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754667070;
	bh=hV5ulevw+EDTUKCYHFOtVgVwDNFnlDvb9cJgbIDjtQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IodIvo9Zz7+55bMfqUeqy9PoLiC2U3yK6LJkP64x9XlLCH/QKI2GinNkCzqobfD/D
	 bdXyxKkn5XZ2ccavHxAEo8gocTYqg8B8qKFaxdB4b0AfwsOYlhfnDJf0RxYqP0s5PZ
	 kEu85dp3HPq1vUbBsFibJP8XkwzFiOE4STbxRou52yATaF3Hr5utcj6xJcbpPENvsX
	 jCMNZIiKJkRLUwddklsxqwSx6hYc0nABQIhVFnMv4lxzVnBUWm3AJcB1CpADQd0srt
	 WNIim3VRLIUEcjUKmOV4v+d2X3NPcYgHUd095TS1Xnsb9B3kZiJRk/+F20oCauEPZT
	 2IBmK3g7PF19g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jorge Marques <jorge.marques@analog.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16-6.1] i3c: master: Initialize ret in i3c_i2c_notifier_call()
Date: Fri,  8 Aug 2025 11:30:47 -0400
Message-Id: <20250808153054.1250675-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808153054.1250675-1-sashal@kernel.org>
References: <20250808153054.1250675-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_083111_105669_B0DE373E 
X-CRM114-Status: GOOD (  11.60  )
X-Mailman-Approved-At: Sun, 14 Sep 2025 13:33:22 -0700
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

RnJvbTogSm9yZ2UgTWFycXVlcyA8am9yZ2UubWFycXVlc0BhbmFsb2cuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgMjkwY2U4YjJkMDc0NWU0NWEzMTU1MjY4MTg0NTIzYThjNzU5OTZmMSBdCgpTZXQg
cmV0IHRvIC1FSU5WQUwgaWYgaTNjX2kyY19ub3RpZmllcl9jYWxsKCkgcmVjZWl2ZXMgYW4gaW52
YWxpZAphY3Rpb24sIHJlc29sdmluZyB1bmluaXRpYWxpemVkIHdhcm5pbmcuCgpTaWduZWQtb2Zm
LWJ5OiBKb3JnZSBNYXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+ClJldmlld2VkLWJ5
OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI1MDYyMi1pM2MtbWFzdGVyLXJldC11bmluaXRpYWxpemVkLXYxLTEtYWFiYjU2MjVj
OTMyQGFuYWxvZy5jb20KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRy
ZS5iZWxsb25pQGJvb3RsaW4uY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFs
QGtlcm5lbC5vcmc+Ci0tLQoKTExNIEdlbmVyYXRlZCBleHBsYW5hdGlvbnMsIG1heSBiZSBjb21w
bGV0ZWx5IGJvZ3VzOgoKKipZRVMqKgoKVGhpcyBjb21taXQgc2hvdWxkIGJlIGJhY2twb3J0ZWQg
dG8gc3RhYmxlIGtlcm5lbCB0cmVlcy4gSGVyZSdzIG15CmV4dGVuc2l2ZSBhbmFseXNpczoKCiMj
IEJ1ZyBBbmFseXNpcwoKVGhlIGNvbW1pdCBmaXhlcyBhIHNlcmlvdXMgdW5pbml0aWFsaXplZCB2
YXJpYWJsZSBidWcgaW4KYGkzY19pMmNfbm90aWZpZXJfY2FsbCgpYC4gTG9va2luZyBhdCB0aGUg
Y29kZToKCjEuICoqVGhlIEJ1ZyoqOiBUaGUgZnVuY3Rpb24gZGVjbGFyZXMgYGludCByZXRgIGF0
IGxpbmUgMjQ0OSBidXQgZG9lc24ndAogICBpbml0aWFsaXplIGl0LiBUaGUgc3dpdGNoIHN0YXRl
bWVudCBvbmx5IGhhbmRsZXMgdHdvIGNhc2VzCiAgIChgQlVTX05PVElGWV9BRERfREVWSUNFYCBh
bmQgYEJVU19OT1RJRllfREVMX0RFVklDRWApLCBsZWF2aW5nIGByZXRgCiAgIHVuaW5pdGlhbGl6
ZWQgZm9yIGFueSBvdGhlciBhY3Rpb24gdmFsdWVzLgoKMi4gKipXaGVuIEl0IFRyaWdnZXJzKio6
IFNpbmNlIHRoaXMgbm90aWZpZXIgaXMgcmVnaXN0ZXJlZCB3aXRoCiAgIGBidXNfcmVnaXN0ZXJf
bm90aWZpZXIoJmkyY19idXNfdHlwZSwgJmkyY2Rldl9ub3RpZmllcilgLCBpdCByZWNlaXZlcwog
ICBBTEwgYnVzIG5vdGlmaWNhdGlvbiBldmVudHMgZm9yIEkyQyBkZXZpY2VzLCBpbmNsdWRpbmc6
CiAgIC0gYEJVU19OT1RJRllfUkVNT1ZFRF9ERVZJQ0VgCiAgIC0gYEJVU19OT1RJRllfQklORF9E
UklWRVJgCiAgIC0gYEJVU19OT1RJRllfQk9VTkRfRFJJVkVSYAogICAtIGBCVVNfTk9USUZZX1VO
QklORF9EUklWRVJgCiAgIC0gYEJVU19OT1RJRllfVU5CT1VORF9EUklWRVJgCiAgIC0gYEJVU19O
T1RJRllfRFJJVkVSX05PVF9CT1VORGAKCjMuICoqSW1wYWN0Kio6IFdoZW4gYW55IG9mIHRoZXNl
IHVuaGFuZGxlZCBhY3Rpb25zIG9jY3VyLCB0aGUgZnVuY3Rpb24KICAgcmV0dXJucyBhbiB1bmlu
aXRpYWxpemVkIHN0YWNrIHZhbHVlLCB3aGljaCBjb3VsZDoKICAgLSBBY2NpZGVudGFsbHkgcmV0
dXJuIGBOT1RJRllfU1RPUGAgb3IgYE5PVElGWV9CQURgLCBoYWx0aW5nIHRoZQogICAgIG5vdGlm
aWNhdGlvbiBjaGFpbgogICAtIENhdXNlIHVucHJlZGljdGFibGUgYmVoYXZpb3IgaW4gdGhlIGRl
dmljZS9kcml2ZXIgYmluZGluZyBwcm9jZXNzCiAgIC0gTGVhZCB0byBpbnRlcm1pdHRlbnQsIGhh
cmQtdG8tZGVidWcgZmFpbHVyZXMKCiMjIEJhY2twb3J0IENyaXRlcmlhIEFuYWx5c2lzCgoxLiAq
KkZpeGVzIGEgcmVhbCBidWcqKjog4pyTIFllcyAtIGZpeGVzIGFuIHVuaW5pdGlhbGl6ZWQgdmFy
aWFibGUgdGhhdAogICBjYXVzZXMgdW5kZWZpbmVkIGJlaGF2aW9yCjIuICoqU21hbGwgYW5kIGNv
bnRhaW5lZCoqOiDinJMgWWVzIC0gYWRkcyBvbmx5IDIgbGluZXMgKGRlZmF1bHQgY2FzZQogICBy
ZXR1cm5pbmcgLUVJTlZBTCkKMy4gKipObyBzaWRlIGVmZmVjdHMqKjog4pyTIENvcnJlY3QgLSB0
aGUgZml4IHByb3Blcmx5IGhhbmRsZXMgdW5leHBlY3RlZAogICBhY3Rpb25zIGJ5IHJldHVybmlu
ZyBhbiBlcnJvcgo0LiAqKk5vIGFyY2hpdGVjdHVyYWwgY2hhbmdlcyoqOiDinJMgQ29ycmVjdCAt
IHNpbXBsZSBidWcgZml4LCBubyBkZXNpZ24KICAgY2hhbmdlcwo1LiAqKkNyaXRpY2FsIHN1YnN5
c3RlbSoqOiDinJMgWWVzIC0gYWZmZWN0cyBJM0MvSTJDIGRldmljZSBtYW5hZ2VtZW50IGFuZAog
ICBkcml2ZXIgYmluZGluZwo2LiAqKkZvbGxvd3Mgc3RhYmxlIHJ1bGVzKio6IOKckyBZZXMgLSBp
bXBvcnRhbnQgYnVnZml4IHdpdGggbWluaW1hbCByaXNrCgojIyBBZGRpdGlvbmFsIENvbnRleHQK
Ci0gVGhlIGJ1ZyB3YXMgaW50cm9kdWNlZCBpbiBjb21taXQgNzJhNDUwMWI1ZDA4ICgiaTNjOiBz
dXBwb3J0CiAgZHluYW1pY2FsbHkgYWRkZWQgaTJjIGRldmljZXMiKSBpbiBKYW51YXJ5IDIwMjIK
LSBUaGUgSTNDIHN1YnN5c3RlbSBoYXMgaGFkIG90aGVyIHVuaW5pdGlhbGl6ZWQgdmFyaWFibGUg
Zml4ZXMgKGUuZy4sCiAgY29tbWl0IDZjYmY4YjM4ZGZlMykKLSBUaGlzIGlzIGEgY2xhc3NpYyBj
b21waWxlciB3YXJuaW5nIGZpeCB0aGF0IHByZXZlbnRzIHJlYWwgcnVudGltZQogIGlzc3Vlcwot
IFRoZSBmaXggaXMgY29uc2VydmF0aXZlLCByZXR1cm5pbmcgLUVJTlZBTCBmb3IgdW5leHBlY3Rl
ZCBhY3Rpb25zCiAgcmF0aGVyIHRoYW4gc2lsZW50bHkgaWdub3JpbmcgdGhlbQoKVGhpcyBpcyBl
eGFjdGx5IHRoZSB0eXBlIG9mIGJ1ZyB0aGF0IHN0YWJsZSBrZXJuZWxzIHNob3VsZCBmaXg6IGEg
cmVhbAppc3N1ZSB3aXRoIHVucHJlZGljdGFibGUgcnVudGltZSBjb25zZXF1ZW5jZXMsIGZpeGVk
IHdpdGggYSBtaW5pbWFsLApzYWZlIGNoYW5nZS4KCiBkcml2ZXJzL2kzYy9tYXN0ZXIuYyB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCmluZGV4IGU1M2M2OWQyNDg3My4u
ZGZhMGJhZDk5MWNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYworKysgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIuYwpAQCAtMjQ2Nyw2ICsyNDY3LDggQEAgc3RhdGljIGludCBpM2NfaTJj
X25vdGlmaWVyX2NhbGwoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwgdW5zaWduZWQgbG9uZyBh
Y3Rpb24KIAljYXNlIEJVU19OT1RJRllfREVMX0RFVklDRToKIAkJcmV0ID0gaTNjX21hc3Rlcl9p
MmNfZGV0YWNoKGFkYXAsIGNsaWVudCk7CiAJCWJyZWFrOworCWRlZmF1bHQ6CisJCXJldCA9IC1F
SU5WQUw7CiAJfQogCWkzY19idXNfbWFpbnRlbmFuY2VfdW5sb2NrKCZtYXN0ZXItPmJ1cyk7CiAK
LS0gCjIuMzkuNQoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
